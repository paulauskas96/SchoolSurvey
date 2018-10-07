function isCustomAnswer(statementId, answerId) {
    var customAnswerRadioBtn = $('.radioButtonForCustom[name=Statement' + statementId + ']');

    if (!customAnswerRadioBtn.attr('id'))
        return false;

    var customAnswerId = getControlAnswerId(customAnswerRadioBtn);

    return customAnswerId == answerId;
}

function getStatementId(control) {

    var nameAttr = control.attr('name');
    var idAttr = control.attr('id');

    if (nameAttr != null) {
        return nameAttr.replace('Statement', '');
    } else if (idAttr != null) {
        return idAttr.replace('statement', '');
    }

    return null;
}

function getControlAnswerId(control) {
    var idAttr = control.attr('id');

    if (idAttr != null) {
        return idAttr.replace('RadioButtonFor', '');
    }
}

function getCustomAnswerTextBox(radioButton) {
    var statementId = getStatementId(radioButton);
    var textBox = $('#CustomAnswerFor' + statementId);

    if (textBox.attr('id') == null)
        return null;

    return textBox;
}

function getAnswer(statementId) {
    var checkedRadioBtn = $('[name=Statement' + statementId + ']:checked');
    var btnId = checkedRadioBtn.attr('id');

    if (btnId == null) {
        var textBox = $('#CustomAnswerFor' + statementId);

        return {
            answerId: textBox.attr('answer'),
            customAnswer: textBox.val(),
        };
    }

    answerId = getControlAnswerId(checkedRadioBtn);
    var customAnswer = null;

    if (checkedRadioBtn.hasClass('radioButtonForCustom')) {
    customAnswer = getCustomAnswer(statementId);
}

    return {answerId, customAnswer };
}

function getCustomAnswer(statementId) {
    var textBox = $('#CustomAnswerFor' + statementId);

    if (textBox.attr('id') == null)
        return null;

    return textBox.val();
}

function highlightErrors(messages) {
    for (i = 0; i < messages.length; i++) {
        var message = messages[i];

        switch (message.error) {
            case 'unchecked':
                var statementLine = $('#statement' + message.statementId);
                statementLine.attr('style', 'color: red');
                break;
            case 'emptyCustom':
                var customAnswerBox = $('#CustomAnswerFor' + message.statementId);
                customAnswerBox.css('border-color', 'red');
                customAnswerBox.focus();
                break;
        }
    }
}

function navigate(navigateFrom, navigateTo) {
    $('#category' + navigateFrom).hide();
    $('#category' + navigateTo).show();
}

function navigateForward(navigateFrom, navigateTo) {
    if (!validateAnswers(navigateFrom)) {
        return;
    }

    navigate(navigateFrom, navigateTo)
}

function validateAnswers(category) {
    var statements = $('.statement[category=' + category + "]");
    var invalidAnswers = [];

    for (i = 0; i < statements.length; i++) {
        var statementId = getStatementId($(statements[i]));
        if ($('.radioButtonNullable[name = Statement' + statementId + ']').length > 0)
            continue;

        var answer = getAnswer(statementId);

        if (answer.answerId == null) {
            invalidAnswers.push({ statementId, error: 'unchecked' });
        } else if (isCustomAnswer(statementId, answer.answerId) && answer.customAnswer.length == 0) {
            invalidAnswers.push({ statementId, error: 'emptyCustom' });
        }
    }

    if (invalidAnswers.length == 0)
        return true;

    highlightErrors(invalidAnswers);
    return false;
}

function finish(scholarId) {
    if (!validateAnswers(2))
        return;

    var statementIds = [];
    var scholarAnswers = [];

    $('.statement').each(function () {
    statementIds.push(getStatementId($(this)));
});

    for (i = 0; i < statementIds.length; i++) {
        var answer = getAnswer(statementIds[i]);

        if (answer.answerId != null) {
            var scholarAnswer = {
                ScholarId: scholarId,
                StatementId: statementIds[i],
                AnswerId: answer.answerId,
                CustomAnswer: answer.customAnswer
            };

            scholarAnswers.push(scholarAnswer);
        }
    }

    $.ajax({
    url: "/Home/Finish",
        type: "POST",
        data: JSON.stringify(scholarAnswers),
        contentType: "application/json; charset=utf-8",
        error: function (response) {
            alert(response.responseText);
        },
        success: function (response) {
            window.location.href = '/Home/Finish';
        }
    });
}

$(function () {
    $('.radioButtonForStandard').change(function () {
        var statementId = getStatementId($(this));
        $('#statement' + statementId).removeAttr('style');

        var textBox = getCustomAnswerTextBox($(this));

        if (textBox != null) {
            $(textBox).css('border-color', '');
            textBox.hide();
        }
    });

    $('.radioButtonForCustom').change(function () {
        var statementId = getStatementId($(this));
        $('#statement' + statementId).removeAttr('style');

        var textBox = getCustomAnswerTextBox($(this));

        textBox.show();
    });

    $('.radioButtonNullable').mousedown(function () {
        event.preventDefault();

        var isChecked = $(this).is(':checked');
        $(this).prop('checked', !isChecked);
    });

    $('.radioButtonNullable').click(function () {
        event.preventDefault();
    });

    $('input[type=text]').change(function () {
        $(this).css('border-color', '');
    });
});
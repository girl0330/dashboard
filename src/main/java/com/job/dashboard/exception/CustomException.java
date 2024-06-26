package com.job.dashboard.exception;

import lombok.Getter;

@Getter
public class CustomException extends RuntimeException {
    private final ExceptionErrorCode exceptionErrorCode;
    private final String userMessage;

    public CustomException(ExceptionErrorCode exceptionErrorCode) {
        this(exceptionErrorCode, exceptionErrorCode.getDetail());
    }

    public CustomException(ExceptionErrorCode exceptionErrorCode, String userMessage) {
        super(userMessage);
        this.exceptionErrorCode = exceptionErrorCode;
        this.userMessage = userMessage;
    }
}

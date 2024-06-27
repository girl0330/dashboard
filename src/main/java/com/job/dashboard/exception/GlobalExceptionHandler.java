package com.job.dashboard.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.sql.SQLIntegrityConstraintViolationException;

import static com.job.dashboard.exception.ExceptionErrorCode.*;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler {

    @ExceptionHandler(value = {CustomException.class}) // CustomException 발생 시
    protected Object handleCustomException(CustomException ex) {
        log.error("Custom exception occurred: {}", ex.getMessage(), ex);

        //404Error
        if (ex.getExceptionErrorCode() == PAGE_NOT_FOUND) {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("jsp/error/404");
            modelAndView.addObject("errorMessage", ex.getUserMessage());
            return modelAndView;
        }

        return ExceptionErrorResponse.toResponseEntity(ex.getExceptionErrorCode(), ex.getUserMessage());
    }

    @ExceptionHandler(value = {Exception.class}) // 예상치 못한 예외 발생 시
    protected ResponseEntity<ExceptionErrorResponse> handleGenericException(Exception ex) {
        log.error("An unexpected error occurred: {}", ex.getMessage(), ex);
        return ExceptionErrorResponse.toResponseEntity(ExceptionErrorCode.GENERIC_ERROR);
    }
}
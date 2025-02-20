package com.llm.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(TokenRetrievalException.class)
    public ResponseEntity<String> handleTokenRetrievalException(TokenRetrievalException ex) {
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.UNAUTHORIZED);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleGeneralException(Exception ex) {
        return new ResponseEntity<>("An error occurred: " + ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    }


    @ExceptionHandler(ComplianceInvestigationException.class)
    public ResponseEntity<ErrorResponse> handleComplianceInvestigation(ComplianceInvestigationException ex) {
        ErrorResponse response = new ErrorResponse();
        response.setRequestId(UUID.randomUUID().toString());
        response.setStatus("failed");
        response.setStatusCode(406);
        response.setErrorCode(45013);
        response.setMessage(ex.getMessage());
        return new ResponseEntity<>(response, HttpStatus.NOT_ACCEPTABLE);
    }

    @ExceptionHandler(CustomerNotAcceptedException.class)
    public ResponseEntity<ErrorResponse> handleCustomerNotAccepted(CustomerNotAcceptedException ex) {
        ErrorResponse response = new ErrorResponse();
        response.setRequestId(UUID.randomUUID().toString());
        response.setStatus("failed");
        response.setStatusCode(406);
        response.setErrorCode(45051);
        response.setMessage(ex.getMessage());
        return new ResponseEntity<>(response, HttpStatus.NOT_ACCEPTABLE);
    }

    @ExceptionHandler(InvalidNationalityException.class)
    public ResponseEntity<ErrorResponse> handleInvalidNationality(InvalidNationalityException ex) {
        ErrorResponse response = new ErrorResponse();
        response.setRequestId(UUID.randomUUID().toString());
        response.setStatus("failed");
        response.setStatusCode(406);
        response.setErrorCode(45053);
        response.setMessage(ex.getMessage());
        return new ResponseEntity<>(response, HttpStatus.NOT_ACCEPTABLE);
    }

    @ExceptionHandler(MissingMandatoryFieldsException.class)
    public ResponseEntity<ErrorResponse> handleMissingMandatoryFields(MissingMandatoryFieldsException ex) {
        ErrorResponse response = new ErrorResponse();
        response.setRequestId(UUID.randomUUID().toString());
        response.setStatus("failure");
        response.setStatusCode(400);
        response.setErrorCode(40002);
        response.setMessage("Invalid format or missing mandatory request");

        // Populate specific field details if any
        Map<String, String> details = new HashMap<>();
        details.put("firstName", "Invalid first name");
        response.setDetails(details);

        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(CustomerUpdateFailedException.class)
    public ResponseEntity<ErrorResponse> handleCustomerUpdateFailed(CustomerUpdateFailedException ex) {
        ErrorResponse response = new ErrorResponse();
        response.setRequestId(UUID.randomUUID().toString());
        response.setStatus("failed");
        response.setStatusCode(404);
        response.setErrorCode(45032);
        response.setMessage(ex.getMessage());
        return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(UnauthorizedException.class)
    public ResponseEntity<ErrorResponse> handleUnauthorized(UnauthorizedException ex) {
        ErrorResponse response = new ErrorResponse();
        response.setRequestId(UUID.randomUUID().toString());
        response.setStatus("failed");
        response.setStatusCode(401);
        response.setMessage("Unauthorized");
        return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
    }

    @ExceptionHandler(BackendTechnicalProblemException.class)
    public ResponseEntity<ErrorResponse> handleBackendTechnicalProblem(BackendTechnicalProblemException ex) {
        ErrorResponse response = new ErrorResponse();
        response.setRequestId(UUID.randomUUID().toString());
        response.setStatus("failed");
        response.setStatusCode(502);
        response.setErrorCode(40001);
        response.setMessage("Backend Technical Problem");
        return new ResponseEntity<>(response, HttpStatus.BAD_GATEWAY);
    }
}

package com.llm.util;

import java.security.SecureRandom;

public class CustomerNumberUtil {

    private static final SecureRandom random = new SecureRandom();
    private static final int CUSTOMER_NUMBER_LENGTH = 10; // We want a 10-digit number

    public static String generateUniqueCustomerNumber() {
        // Generate a random 10-digit number
        return generateRandomDigits(CUSTOMER_NUMBER_LENGTH);
    }

    // Utility method to generate a random number with the specified number of digits
    private static String generateRandomDigits(int length) {
        StringBuilder randomNumber = new StringBuilder();

        // Ensure the first digit is not 0 to avoid a leading zero in the number
        randomNumber.append(random.nextInt(9) + 1); // First digit (1-9)

        // Generate remaining digits (0-9)
        for (int i = 1; i < length; i++) {
            randomNumber.append(random.nextInt(10)); // Append random digits (0-9)
        }
        return randomNumber.toString();
    }

}

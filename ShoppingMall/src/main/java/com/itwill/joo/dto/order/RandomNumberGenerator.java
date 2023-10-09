package com.itwill.joo.dto.order;

import java.security.SecureRandom;

public class RandomNumberGenerator {
    private static final String NUMBERS = "0123456789";
    private static SecureRandom random = new SecureRandom();

    public static String generateRandomNumber() {
        StringBuilder sb = new StringBuilder(10);
        for (int i = 0; i < 10; i++) {
            int randomIndex = random.nextInt(10);
            char randomDigit = NUMBERS.charAt(randomIndex);
            sb.append(randomDigit);
        }
        return sb.toString();
    }
}

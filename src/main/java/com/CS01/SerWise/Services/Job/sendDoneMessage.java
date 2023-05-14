package com.CS01.SerWise.Services.Job;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

public class sendDoneMessage {
    public static void sendMessage(String api) {
        try {

            // Create URL object
            URL url = new URL(api);

            // Open connection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Close the connection
            connection.disconnect();

//            // Set request method
//            connection.setRequestMethod("GET");
//
//            // Get response code
//            int responseCode = connection.getResponseCode();
//
//            // Check if request was successful (status code 200)
//            if (!(responseCode == HttpURLConnection.HTTP_OK)) {
//                System.out.println("Connection Now Successful.");
//            }
//
//            // Close the connection
//            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
            // Handle exception
        }
    }
}

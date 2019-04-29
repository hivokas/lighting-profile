#include "Adafruit_NeoPixel.h"
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

#define WIFI_INDICATOR_PIN 14
#define PIN 2
#define NUMPIXELS 8

const char* ssid = "hivokas";
const char* password = "hivokas.com";
const char* id = 102;
const char* token = "c4ca4238a0b923820dcc509a6f75849b";

Adafruit_NeoPixel strip = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

void setup () {
    strip.begin();
    pinMode(PIN, OUTPUT);

    Serial.begin(115200);
    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED) {
        delay(1000);
        Serial.print("Connecting..");
    }

    Serial.print("Connected..");

    digitalWrite(WIFI_INDICATOR_PIN, HIGH);
}

void loop() {
    // Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
        // Declare an object of class HTTPClient
        HTTPClient http;

        // Specify request destination
        http.begin("http://plpms.hivokas.com/iot?id="+id+"&token="+token);

        // Send the request
        int httpCode = http.GET();

        // Check the returning code
        if (httpCode > 0) {
            // Get the request response payload
            String payload = http.getString();

            // Print the response payload
            Serial.println(payload);

            int r, g, b;

            // Parse RGB values
            sscanf(payload.c_str(), "%02x%02x%02x", &r, &g, &b);

            // Log values
            Serial.println("red: "+r+"; green: "+g+"; blue: "+b+".");

            // Display color on LED
            for (int i = 0; i < 8; ++i) {
                for (int j = 0; j < 8; j++) {
                    strip.setPixelColor(j, strip.Color(0, 0, 0));
                }
                strip.setPixelColor(i, strip.Color(r, g, b));
                strip.show();
                delay(250);
            }
        } else {
            Serial.print("Invalid status code..");
        }

        // Close connection
        http.end();
    }
}
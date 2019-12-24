package com.poc.utils;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileReader;
import java.io.IOException;
import java.time.Instant;



public class JsonUtils {

    private static final String PATH_TO_JSON = "src/test/resources/json/";

    public static String readJson(String filename) {
        String json = null;
        try {
            FileReader fileReader = new FileReader(PATH_TO_JSON + filename);
            JSONObject jsonObject = (JSONObject) new JSONParser().parse(fileReader);
            json = jsonObject.toJSONString();
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
        return json;
    }


    public static String updateJson(String json, String key, String value) {
        String updatedJson = null;
        try {
            JSONObject jsonObject = (JSONObject) new JSONParser().parse(json);
            jsonObject.put(key, value);

            // next 3 lines are tmp
            String name = jsonObject.get("name").toString();
            name = name + " " + Instant.now().getEpochSecond();
            jsonObject.put("name", name);

            updatedJson = jsonObject.toJSONString();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return updatedJson;
    }


    public static void main(String[] args) {
        String json = readJson("create-update-employee.json");
        json = updateJson(json, "name", "Kenric");

        System.out.println("JSON: " + json);
        System.out.println(Instant.now().getEpochSecond());
    }

}

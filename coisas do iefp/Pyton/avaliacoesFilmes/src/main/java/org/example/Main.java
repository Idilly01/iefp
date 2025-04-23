package org.example;
import java.io.IOException;
import java.net.URI;
import okhttp3.*;

import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class Main {
    public static void main(String[] args) {
        String API_KEY = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDRjZWQ0YzlkNTAyMDEwZTNmM2MxODliNDNiNmQxOCIsIm5iZiI6MTczOTg4OTA4Mi4yNTUsInN1YiI6IjY3YjQ5OWJhYTY1ZDYzMDNlN2UxMGVjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gVFPoy5BQw3gJAp7oresyw8r3QkXfQeLe7ChKG33sWA";
        String BASE_URL = "https://api.themoviedb.org/3/movie/top_rated";
        OkHttpClient client = new OkHttpClient();
        Request request =  new Request.Builder()
               .url(BASE_URL)
               .get()
               .addHeader("accept", "application/json")
               .addHeader("Authorization", API_KEY)
               .build();

        try(Response response = client.newCall(request).execute()) {
            System.out.println(response.body().string());
        } catch (IOException e){
            e.printStackTrace();
        }
    }
}


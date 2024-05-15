package demospringmvc.service;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Service
public class ChatbotService {
    private RestTemplate restTemplate = new RestTemplate();
    private ObjectMapper mapper = new ObjectMapper();

    public String chatWithBot(String message, String previousQuestion) {
        String url = "https://api.openai.com/v1/chat/completions";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer sk-proj-B1slHrGndYi7AlVxYXFUT3BlbkFJzE53qwFqxSTMkxQBgSn3");

        ArrayList<HashMap<String, String>> messages = new ArrayList<>();
        messages.add(new HashMap<String, String>() {{ put("role", "system"); put("content", "Thanks"); }});
        messages.add(new HashMap<String, String>() {{ put("role", "user"); put("content", encodeMessage(previousQuestion)); }});
        messages.add(new HashMap<String, String>() {{ put("role", "user"); put("content", encodeMessage(message)); }});

        HashMap<String, Object> map = new HashMap<>();
        map.put("model", "gpt-3.5-turbo");
        map.put("messages", messages);

        try {
            String jsonRequest = mapper.writeValueAsString(map);
            HttpEntity<String> request = new HttpEntity<>(jsonRequest, headers);

            ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);

            return response.getBody();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String encodeMessage(String message) {
        try {
            return URLEncoder.encode(message, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return message;
        }
    }

    private String decodeMessage(String message) {
        try {
            return URLDecoder.decode(message, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return message;
        }
    }
}

package demospringmvc.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import demospringmvc.service.ChatbotService;
import org.springframework.web.client.RestClientException;

@RestController
public class ChatController {
    @Autowired
    private ChatbotService chatbotService;

    @PostMapping("/chat")
    public String chat(@RequestParam String message, @RequestParam(required = false) String previousQuestion) {
        try {
            return chatbotService.chatWithBot(message, previousQuestion);
        } catch (RestClientException e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
}


package notificador.WhatsApp;


import com.twilio.Twilio;
import com.twilio.converter.Promoter;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import java.net.URI;
import java.math.BigDecimal;

public class NotificadorWhatsApp {
// Find your Account Sid and Token at twilio.com/console
public static final String ACCOUNT_SID = "ACceb26feb835bb4276370109913ad91ed";
public static final String AUTH_TOKEN = "ae6555c43605e7325f342398ed2b6649";

public static void main(String[] args) {
Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
Message message = Message.creator(
new PhoneNumber("whatsapp:+5491133430235"),
new PhoneNumber("whatsapp:+14155238886"),
"Notificacion de suscripciones")
.create();

System.out.println(message.getSid());
}
}


Telegram

package notificador.telegram;

import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Chat;
import org.telegram.telegrambots.meta.api.objects.Update;

public class TelegramBot extends TelegramLongPollingBot {

@Override
public void onUpdateReceived(Update update) {
// TODO Auto-generated method stub
final String mensaje = update.getMessage().getText();

System.out.println(mensaje);

final String chatId = update.getMessage().getChat().getUserName();

System.out.println(chatId);

}

private SendMessage generateSendMessage(Long chatId, int characterCount) {
return new SendMessage(chatId.toString(), "The Message have " + characterCount + " characters");
}

@Override
public String getBotUsername() {
// TODO Auto-generated method stub
return "CSS108Notificador_utn_bot";
}

@Override
public String getBotToken() {
// TODO Auto-generated method stub
return  "7488442886:AAFwLufU8QC85lVsKUq-24ywnAZWJlmiEFA";
}

}

Main



package notificador.Telegram;

import org.telegram.telegrambots.meta.TelegramBotsApi;
import org.telegram.telegrambots.updatesreceivers.DefaultBotSession;

public class Main {
public static void main(String[] args) {
try {
TelegramBotsApi telegramBotsApi = new TelegramBotsApi(DefaultBotSession.class);
telegramBotsApi.registerBot(new TelegramBot());
} catch (Exception e) {
e.printStackTrace();
}
}
}


POM

<dependency>
<groupId>org.telegram</groupId>
<artifactId>telegrambots</artifactId>
<version>6.5.0</version>
</dependency>
<dependency>
<groupId>com.twilio.sdk</groupId>
<artifactId>twilio</artifactId>
<version>9.2.5</version>
<scope>compile</scope>
</dependency>

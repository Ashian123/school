const { Client } = require("whatsapp-web.js");
const client = new Client();
const qrcode = require("qrcode-terminal");
const fs = require("fs");

client.on("qr", (qr) => {
  //   qrcode.generate(qr, { small: true });
  // console.log(qr);
  try {
    fs.writeFileSync("./routes/admin/last.qr", qr);
  } catch (err) {
    console.error(err);
  }
});

client.on("ready", () => {
  console.log("Client is ready!");

  // Number where you want to send the message.
  // fs.readFile("./routes/admin/last.json", (err, data) => {
  //   var { ph_number, content_msg } = JSON.parse(data);
  const numbers = `+919840133219`;
  // Your message.
  const text = "content_msg";

  // Getting chatId from the number.
  // we have to delete "+" from the beginning and add "@c.us" at the end of the number.
  // numbers.forEach((number) => {
  const chatId = numbers.substring(1) + "@c.us";
  console.log(chatId);

  // Sending message.
  client.sendMessage(chatId, text);
  // });
  // });
});

client.on("message", (msg) => {
  if (msg.body == "!ping") {
    msg.reply("pong");
  }
});

client.initialize();

var nodemailer = require("nodemailer");

exports.mail = async ({ email_id, text, subject }) => {
  var transporter = nodemailer.createTransport({
    port: 25,
    secure: false,
    host: "localhost",
    auth: {
      user: process.env.DOMAIN_EMAIL_ID,
      pass: process.env.DOMAIN_EMAIL_PASSWORD,
    },
    tls: {
      rejectUnauthorized: false,
    },
  });

  var mailOptions = {
    from: process.env.DOMAIN_EMAIL_ID,
    // to: email_id,
    bcc: email_id,
    subject,
    text,
  };
  try {
    var msg = await transporter.sendMail(mailOptions);
    console.log(msg.response);
    return "Email sent to your Mail-ID";
  } catch (error) {
    return "Something went wrong,Try again later";
  }
};

from flask_mail import Message
from app import mail

def send_email(subject, sender, recipients):
    msg = Message(subject, sender = sender, recipients = recipients)
    msg.body = "Text body test"
    mail.send(msg)
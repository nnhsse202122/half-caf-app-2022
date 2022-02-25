from flask_mail import Message
from app import mail

def send_email(name, body, subject, sender, recipients):
    msg = Message(subject, sender = sender, recipients = recipients)
    #orderBody = "your order is complete! This is what you will be recieving: " , ''.join(body)
    msg.body = "Hi " + name + "! Thanks for ordering from the Half-Caf! Your order has been completed and you will be recieving it shortly. Here is what you have ordered: " + str(body) 
    mail.send(msg)
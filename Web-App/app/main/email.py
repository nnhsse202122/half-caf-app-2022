from flask_mail import Message
from app import mail

def send_email(subject, sender,recipients, text_body, html_body):
    msg = Message(subject, sender = sender, recipients = recipients)
    msg.body = text_body
    msg.html = html_body
    mail.send(msg)


# >>> from flask_mail import Message
# >>> from app import mail
# >>> msg = Message('test subject', sender=app.config['ADMINS'][0],
# ... recipients=['your-email@example.com'])
# >>> msg.body = 'text body'
# >>> msg.html = '<h1>HTML body</h1>'
# >>> mail.send(msg)
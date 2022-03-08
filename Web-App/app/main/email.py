from flask_mail import Message
from app import mail

def order_email(name, order, subject, sender, recipients):
    msg = Message(subject, sender = sender, recipients = recipients)
    msg.body = "Hi " + name + "! Thanks for ordering from the Half-Caf! Your order has been completed and you will be recieving it shortly. Here is what you have ordered: " + str(order) 
    msg.html = "Hi " + name + "! Thanks for ordering from the Half-Caf! <br> \
    Your order has been completed and you will be receiving it shortly. <br> Here is what you have ordered: " + str(order)
    mail.send(msg)

def reg_email(user):
    msg = Message("Please activate new user", sender = 'nnhshalfcafapp@gmail.com', recipients = ['nnhshalfcafapp@gmail.com'])
    msg.body = "username: " + user.username + " user type: " + user.user_type + " user email: " + user.email_address
    msg.html = "<b> Username: </b>" + user.username + "<br> <b> User Type: </b>" + user.user_type + "<br><b> User Email Address: </b>"+ user.email_address
    mail.send(msg)

The following required functionality is complete:

- [x]User can sign up by providing their email, password, and name.
- [x]User can login using an email and password.
- [ ]After logging in, the user is taken to an INBOX page that has a list of incoming messages, sorted in descending chronological order (newest messages at top)
- [ ]Provide a fake "new message" link and a "sent messages" link BUT don't have to make them work yet.
- [ ]Unread messages should be bold or something similar in the list of messages.
- [x]Implement "Users" link to take the user to a page that lists all users. Next to/under each user, provide a link to "Add As Friend" to add the user to your list of friends.
- [ ]Implement "New Message" page. The recipient field should be a dropdown, where the options are names from the user's friends.
- [ ]Implement "Sent Messages" page. It lists messages you have sent. Each message should display at what time it was read by the recipient, or "unread".
- [ ]User can read a message's content only once. Once the message has been read, the user will see a page indicating the message has already been read.
- [ ]User can only read messages where they are the recipient.
Bonus User Stories
- [ ]User cannot read the contents messages on Sent Messages page (only see subject, recipient and time sent)
- [ ]User can attach an image. The easiest way is to use https://www.filepicker.com/. I haven't tried, but on - [ ]Heroku it should be easy to use Filepicker add-on. However, if you want to upload to your own file system check out carrierwave.
- [ ]User can log in with Facebook. guide.
- [ ]If interested, you can check out authentication as a service https://oauth.io instead.
- [ ]User can specify multiple recipients per message. HINT: the are a few ways to do it, but one way is to use a general form_tag and create a message for each recipient submitted from the form.
- [ ]Implement Infinite Scroll to view when the logged user user has received a lot of messages. You can use the kaminari gem and jquery-infinite-pages gem.
- [ ]User gets an email when they receive a message, with a link to view the message.
- [ ]Read Active Mailer Basics on how to send emails.
- [ ]Check out letter_opener to test emails on localhost.
- [ ]Check out Email/SMS addons on Heroku if you want to implement it on Heroku. Sendgrid is a good free option.
- [ ]Check out sucker_punch gem if you want a simple way to send email via a background task. For serious apps, you should use sidekiq gem instead.
- [ ]User A can "block" User B. If User A blocks User B, User B cannot send User A a message.
- [ ]Designing the schema for this may be tricky. Ask questions and share your schema if you get stuck.
- [x]User can remove friends from their friends list.
- [ ]User can unblock friends from their block list.
- [ ]User can send a message to the email address of a non-registered user. The recipient will receive an email with a link to sign up for the service, and after creating an account, will be able to view the sent message.
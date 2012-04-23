{% if contact.sent %}

<p id="contact_sent">Your message has been sent and we will respond as soon as possible.</p>

{% else %}

<p>Submit the form below and we will get back to you as soon as possible.</p>

<form id="contact_form" method="post" action="/contact">

  <dl>

    <dt><label for="name">Name</label></dt>
    <dd class="input">{{ contact | contact_input: 'name' }}</dd>

    <dt><label for="email">Email</label></dt>
    <dd class="input">{{ contact | contact_input: 'email' }}</dd>

    <dt><label for="subject">Subject</label></dt>
    <dd class="input">{{ contact | contact_input: 'subject' }}</dd>

    <dt><label for="message">Message</label></dt>
    <dd class="textarea">{{ contact | contact_input: 'message' }}</dd>

    <dt><label for="captcha">Spam check</label></dt>
    <dd class="captcha">
      {{ contact.captcha }}
      <div class="input">{{ contact | contact_input: 'captcha' }}</div>
      <p class="instruction">Enter the characters from the image shown.</p>
    </dd>

  </dl>

  <input class="button" name="submit" type="submit" value="Send">

</form>

{% endif %}

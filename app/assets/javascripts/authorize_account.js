class AuthorizeAccount {
  constructor(emailField, pubKey, domain) {
    this.emailField = emailField;
    this.pubKey = pubKey;
    this.domain = domain;
  }

  async accessRequest() {
    const boltEmbedded = Bolt(this.pubKey);

    if (this.emailField) {
      const email = this.emailField.value
      const encodedEmail = encodeURIComponent(email);
      // Call the endpoint to check if the email already exist on bolt
      const response = await fetch(this.domain + "/v1/account/exists?email=" + encodedEmail);
      const responseAsJson = await response.json();

      if(responseAsJson.has_bolt_account) {
        this.emailField.parentNode.setAttribute("class", "email-div")
        let authorizationComponent = boltEmbedded.create("authorization_component", {style: "callout"});
        await authorizationComponent.mount(".email-div");
        // start OTP modal
        let authorizationResponse = await authorizationComponent.authorize({"email": email});
        if (authorizationResponse) {

          const authorizationCode = authorizationResponse.authorizationCode;
          const scope = authorizationResponse.scope ;

          document.location.href = `/users/auth/bolt?authorization_code=${authorizationCode}&scope=${scope}`
        }
      }
    }
  }
}

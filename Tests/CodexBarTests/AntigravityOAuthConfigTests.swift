import CodexBarCore
import Testing

@Suite("AntigravityOAuthConfig Tests")
struct AntigravityOAuthConfigTests {
    @Test("configurationErrorMessage rejects placeholder credentials")
    func placeholderCredentials() {
        let message = AntigravityOAuthConfig.configurationErrorMessage(
            clientId: "REPLACE_WITH_OAUTH_CLIENT_ID",
            clientSecret: "real-secret")
        #expect(message != nil)
    }

    @Test("configurationErrorMessage rejects empty credentials")
    func emptyCredentials() {
        let message = AntigravityOAuthConfig.configurationErrorMessage(
            clientId: "   ",
            clientSecret: "")
        #expect(message != nil)
    }

    @Test("configurationErrorMessage accepts real credentials")
    func realCredentials() {
        let message = AntigravityOAuthConfig.configurationErrorMessage(
            clientId: "client-id.apps.googleusercontent.com",
            clientSecret: "super-secret")
        #expect(message == nil)
    }
}

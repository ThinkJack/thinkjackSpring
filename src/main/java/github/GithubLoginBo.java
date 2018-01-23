package github;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import common.PrivateKey;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

public class GithubLoginBo {

    PrivateKey key=new PrivateKey();

    private String CLIENT_ID = key.getGitClientId();
    private String CLIENT_SECRET = key.getGitClientSecret();
    private String REDIRECT_URI = key.getGitRedirectUri();
    private String SESSION_STATE = key.getGitSessionState();
    /* 프로필 조회 API URL */
    private String PROFILE_API_URL = key.getGitProfileApiUrl();

    /* github 인증 URL 생성 Method */
    public String getAuthorizationUrl(HttpSession session) {

        /* 세션 유효성 검증을 위하여 난수를 생성 */
        String state = generateRandomString();
        /* 생성한 난수 값을 session에 저장 */
        setSession(session,state);

        /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 github 인증 URL 생성 */
        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state)
                .build(GitHubApi.instance());

        return oauthService.getAuthorizationUrl();
    }

    /* github Callback 처리 및 AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
            System.out.println("github getAccessToken 진입");

        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
//        System.out.println("========들어오는 값 ==========");
//        System.out.println("session : "+session);
//
//
        String sessionState = getSession(session);
//        System.out.println("sessionState: "+sessionState);
//        System.out.println("state: "+state);
        if(StringUtils.pathEquals(sessionState, state)){

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(GitHubApi.instance());

            /* Scribe에서 제공하는 AccessToken 획득 기능으로 git Access Token을 획득 */
            System.out.println("세션 검증 완료 ");
           // System.out.println("oauthService :"+oauthService.getAccessToken(code));
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            System.out.println("토큰 저장 완료 ");
            return accessToken;
        }
        return null;
    }

    /* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    /* http session에 데이터 저장 */
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);
    }

    /* http session에서 데이터 가져오기 */
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }

    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(GitHubApi.instance());

        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }
}

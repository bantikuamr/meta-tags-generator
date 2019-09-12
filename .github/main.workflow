<!-- facebook -->
<script>
	window.fbAsyncInit = function() {
		FB.init({
			appId      : '{{ FACEBOOK_APP_ID }}', // App ID
			channelUrl : '{{ STATIC_URL }}channel.html', // Channel File
			status     : true, // check login status
			cookie     : true, // enable cookies to allow the server to access the session
			oauth      : true, // enable OAuth 2.0
			xfbml      : true  // parse XFBML
		});
		// Additional initialization code here
		FB.Event.subscribe('auth.login', function(response){
			window.location = '{% url on-fb-login %}?fb_access_token='+response.authResponse.accessToken;
		});
		FB.Event.subscribe('auth.logout', function(response){
			window.location = '{% url logout %}';
		});
	};
</script>

<div id="fb-root"></div>
<script type="text/javascript">
	(function() {
		var e = document.createElement('script'); e.async = true;
		e.src = document.location.protocol +
			'//connect.facebook.net/en_US/all.js';
		document.getElementById('fb-root').appendChild(e);
	}());
</script>
<!-- end facebook -->

<%@page import="com.model.UserModel2"%>
<%@page import="java.util.List"%>
<%-- <%@page import="com.model.Following"%>
<%@page import="com.model.Tweets"%> --%>
<%@page import="com.model.UserModel2"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.DataAccessLayer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%
	response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);

      if(session.getAttribute("id")==null)
      {
    	  response.sendRedirect("Login.jsp");
    	  return;
      }
%> --%>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Home</title>
<meta name="robots" content="NOODP">
<meta name="description"
	content="Welcome back to Twitter. Sign in now to check your notifications, join the conversation and catch up on Tweets from the people you follow.">
<meta name="msapplication-TileImage"
	content="//abs.twimg.com/favicons/win8-tile-144.png">
<meta name="msapplication-TileColor" content="#00aced">

 <link rel="icon" href="images/favicon.png" type="image/png">

<link rel="apple-touch-icon"
	href="https://abs.twimg.com/icons/apple-touch-icon-192x192.png"
	sizes="192x192">
<link rel="manifest" href="https://twitter.com/manifest.json">

<meta name="viewport" id="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="swift-page-name" id="swift-page-name" content="login">
<meta name="swift-page-section" id="swift-section-name" content="login">

<link rel="canonical" href="https://twitter.com/login">
<link rel="alternate" hreflang="x-default"
	href="https://twitter.com/login">
<link rel="alternate" hreflang="fr"
	href="https://twitter.com/login?lang=fr">
<link rel="alternate" hreflang="en"
	href="https://twitter.com/login?lang=en">
<link rel="alternate" hreflang="ar"
	href="https://twitter.com/login?lang=ar">
<link rel="alternate" hreflang="ja"
	href="https://twitter.com/login?lang=ja">
<link rel="alternate" hreflang="es"
	href="https://twitter.com/login?lang=es">
<link rel="alternate" hreflang="de"
	href="https://twitter.com/login?lang=de">
<link rel="alternate" hreflang="it"
	href="https://twitter.com/login?lang=it">
<link rel="alternate" hreflang="id"
	href="https://twitter.com/login?lang=id">
<link rel="alternate" hreflang="pt"
	href="https://twitter.com/login?lang=pt">
<link rel="alternate" hreflang="ko"
	href="https://twitter.com/login?lang=ko">
<link rel="alternate" hreflang="tr"
	href="https://twitter.com/login?lang=tr">
<link rel="alternate" hreflang="ru"
	href="https://twitter.com/login?lang=ru">
<link rel="alternate" hreflang="nl"
	href="https://twitter.com/login?lang=nl">
<link rel="alternate" hreflang="fil"
	href="https://twitter.com/login?lang=fil">
<link rel="alternate" hreflang="ms"
	href="https://twitter.com/login?lang=ms">
<link rel="alternate" hreflang="zh-tw"
	href="https://twitter.com/login?lang=zh-tw">
<link rel="alternate" hreflang="zh-cn"
	href="https://twitter.com/login?lang=zh-cn">
<link rel="alternate" hreflang="hi"
	href="https://twitter.com/login?lang=hi">
<link rel="alternate" hreflang="no"
	href="https://twitter.com/login?lang=no">
<link rel="alternate" hreflang="sv"
	href="https://twitter.com/login?lang=sv">
<link rel="alternate" hreflang="fi"
	href="https://twitter.com/login?lang=fi">
<link rel="alternate" hreflang="da"
	href="https://twitter.com/login?lang=da">
<link rel="alternate" hreflang="pl"
	href="https://twitter.com/login?lang=pl">
<link rel="alternate" hreflang="hu"
	href="https://twitter.com/login?lang=hu">
<link rel="alternate" hreflang="fa"
	href="https://twitter.com/login?lang=fa">
<link rel="alternate" hreflang="he"
	href="https://twitter.com/login?lang=he">
<link rel="alternate" hreflang="ur"
	href="https://twitter.com/login?lang=ur">
<link rel="alternate" hreflang="th"
	href="https://twitter.com/login?lang=th">
<link rel="alternate" hreflang="uk"
	href="https://twitter.com/login?lang=uk">
<link rel="alternate" hreflang="ca"
	href="https://twitter.com/login?lang=ca">
<link rel="alternate" hreflang="ga"
	href="https://twitter.com/login?lang=ga">
<link rel="alternate" hreflang="el"
	href="https://twitter.com/login?lang=el">
<link rel="alternate" hreflang="eu"
	href="https://twitter.com/login?lang=eu">
<link rel="alternate" hreflang="cs"
	href="https://twitter.com/login?lang=cs">
<link rel="alternate" hreflang="gl"
	href="https://twitter.com/login?lang=gl">
<link rel="alternate" hreflang="ro"
	href="https://twitter.com/login?lang=ro">
<link rel="alternate" hreflang="hr"
	href="https://twitter.com/login?lang=hr">
<link rel="alternate" hreflang="en-gb"
	href="https://twitter.com/login?lang=en-gb">
<link rel="alternate" hreflang="vi"
	href="https://twitter.com/login?lang=vi">
<link rel="alternate" hreflang="bn"
	href="https://twitter.com/login?lang=bn">
<link rel="alternate" hreflang="bg"
	href="https://twitter.com/login?lang=bg">
<link rel="alternate" hreflang="sr"
	href="https://twitter.com/login?lang=sr">
<link rel="alternate" hreflang="sk"
	href="https://twitter.com/login?lang=sk">
<link rel="alternate" hreflang="gu"
	href="https://twitter.com/login?lang=gu">
<link rel="alternate" hreflang="mr"
	href="https://twitter.com/login?lang=mr">
<link rel="alternate" hreflang="ta"
	href="https://twitter.com/login?lang=ta">
<link rel="alternate" hreflang="kn"
	href="https://twitter.com/login?lang=kn">
<link rel="alternate"
	media="handheld, only screen and (max-width: 640px)"
	href="https://mobile.twitter.com/session/new">
<link rel="alternate"
	href="android-app://com.twitter.android/twitter/login?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eandroidseo%7Ctwgr%5Elogin">
<link rel="search" type="application/opensearchdescription+xml"
	href="https://twitter.com/opensearch.xml" title="Twitter">
<link id="async-css-placeholder">

<script type="text/javascript" charset="utf-8" async=""
	src="./Login on Twitter_files/16.commons.en.fb532c6b3c585e24eafd.js.download"></script>
<script type="text/javascript" charset="utf-8" async=""
	src="./Login on Twitter_files/5.pages_front.en.9ec21acd4f24016905ab.js.download"></script>
<style>
body {
	background-image: url(images/Twitter-logo1.jpg);
	background-size: cover;
}
}
</style>

 <%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);

      if(session.getAttribute("uid")==null)
      {
    	  response.sendRedirect("index.jsp");
    	  return;
      }
%>

</head>
<body class="three-col logged-out ms-windows"
	data-fouc-class-names="swift-loading" dir="ltr">
	<input type="hidden" id="init-data" class="json-data"
		value="{&quot;keyboardShortcuts&quot;:[{&quot;name&quot;:&quot;Actions&quot;,&quot;description&quot;:&quot;Shortcuts for common actions.&quot;,&quot;shortcuts&quot;:[{&quot;keys&quot;:[&quot;Enter&quot;],&quot;description&quot;:&quot;Open Tweet details&quot;},{&quot;keys&quot;:[&quot;o&quot;],&quot;description&quot;:&quot;Expand photo&quot;},{&quot;keys&quot;:[&quot;\/&quot;],&quot;description&quot;:&quot;Search&quot;}]},{&quot;name&quot;:&quot;Navigation&quot;,&quot;description&quot;:&quot;Shortcuts for navigating between items in timelines.&quot;,&quot;shortcuts&quot;:[{&quot;keys&quot;:[&quot;?&quot;],&quot;description&quot;:&quot;This menu&quot;},{&quot;keys&quot;:[&quot;j&quot;],&quot;description&quot;:&quot;Next Tweet&quot;},{&quot;keys&quot;:[&quot;k&quot;],&quot;description&quot;:&quot;Previous Tweet&quot;},{&quot;keys&quot;:[&quot;Space&quot;],&quot;description&quot;:&quot;Page down&quot;},{&quot;keys&quot;:[&quot;.&quot;],&quot;description&quot;:&quot;Load new Tweets&quot;}]},{&quot;name&quot;:&quot;Timelines&quot;,&quot;description&quot;:&quot;Shortcuts for navigating to different timelines or pages.&quot;,&quot;shortcuts&quot;:[{&quot;keys&quot;:[&quot;g&quot;,&quot;u&quot;],&quot;description&quot;:&quot;Go to user\u2026&quot;}]}],&quot;composeIgnoreAttachmentText&quot;:true,&quot;baseFoucClass&quot;:&quot;swift-loading&quot;,&quot;bodyFoucClassNames&quot;:&quot;swift-loading&quot;,&quot;macawSwift&quot;:true,&quot;assetsBasePath&quot;:&quot;https:\/\/abs.twimg.com\/a\/1486704320\/&quot;,&quot;assetVersionKey&quot;:&quot;3f6ec6&quot;,&quot;emojiAssetsPath&quot;:&quot;https:\/\/abs.twimg.com\/emoji\/v2\/72x72\/&quot;,&quot;environment&quot;:&quot;production&quot;,&quot;formAuthenticityToken&quot;:&quot;667997583021bc91b78a764da8ae5e31eb1c183d&quot;,&quot;loggedIn&quot;:false,&quot;screenName&quot;:null,&quot;fullName&quot;:null,&quot;userId&quot;:null,&quot;guestId&quot;:&quot;147435562491678920&quot;,&quot;allowAdsPersonalization&quot;:true,&quot;scribeBufferSize&quot;:3,&quot;pageName&quot;:&quot;login&quot;,&quot;sectionName&quot;:&quot;login&quot;,&quot;scribeParameters&quot;:{},&quot;recaptchaApiUrl&quot;:&quot;https:\/\/www.google.com\/recaptcha\/api\/js\/recaptcha_ajax.js&quot;,&quot;internalReferer&quot;:null,&quot;geoEnabled&quot;:false,&quot;typeaheadData&quot;:{&quot;accounts&quot;:{&quot;enabled&quot;:true,&quot;localQueriesEnabled&quot;:false,&quot;remoteQueriesEnabled&quot;:true,&quot;limit&quot;:6},&quot;trendLocations&quot;:{&quot;enabled&quot;:true},&quot;dmConversations&quot;:{&quot;enabled&quot;:false},&quot;savedSearches&quot;:{&quot;enabled&quot;:false,&quot;items&quot;:[]},&quot;dmAccounts&quot;:{&quot;enabled&quot;:false,&quot;localQueriesEnabled&quot;:false,&quot;remoteQueriesEnabled&quot;:false,&quot;onlyDMable&quot;:true},&quot;mediaTagAccounts&quot;:{&quot;enabled&quot;:false,&quot;localQueriesEnabled&quot;:true,&quot;remoteQueriesEnabled&quot;:false,&quot;onlyShowUsersWithCanMediaTag&quot;:false,&quot;currentUserId&quot;:-1},&quot;selectedUsers&quot;:{&quot;enabled&quot;:false},&quot;prefillUsers&quot;:{&quot;enabled&quot;:false},&quot;topics&quot;:{&quot;enabled&quot;:true,&quot;localQueriesEnabled&quot;:false,&quot;remoteQueriesEnabled&quot;:true,&quot;prefetchLimit&quot;:500,&quot;limit&quot;:4},&quot;concierge&quot;:{&quot;enabled&quot;:false,&quot;localQueriesEnabled&quot;:false,&quot;remoteQueriesEnabled&quot;:false,&quot;prefetchLimit&quot;:500,&quot;limit&quot;:6},&quot;recentSearches&quot;:{&quot;enabled&quot;:false},&quot;hashtags&quot;:{&quot;enabled&quot;:false,&quot;localQueriesEnabled&quot;:false,&quot;remoteQueriesEnabled&quot;:true,&quot;prefetchLimit&quot;:500},&quot;useIndexedDB&quot;:false,&quot;showSearchAccountSocialContext&quot;:false,&quot;showDebugInfo&quot;:false,&quot;useThrottle&quot;:true,&quot;accountsOnTop&quot;:false,&quot;remoteDebounceInterval&quot;:300,&quot;remoteThrottleInterval&quot;:300,&quot;tweetContextEnabled&quot;:false,&quot;fullNameMatchingInCompose&quot;:true,&quot;topicsWithFiltersEnabled&quot;:false},&quot;dm&quot;:{&quot;notifications&quot;:false,&quot;usePushForNotifications&quot;:false,&quot;participant_max&quot;:50,&quot;typing_indicators_publish&quot;:true,&quot;typing_indicators_ui&quot;:true,&quot;live_pipeline_subscribe&quot;:true,&quot;welcome_message_add_to_conversation_enabled&quot;:true,&quot;poll_options&quot;:{&quot;foreground_poll_interval&quot;:3000,&quot;burst_poll_interval&quot;:3000,&quot;burst_poll_duration&quot;:300000,&quot;max_poll_interval&quot;:60000},&quot;card_prefetch&quot;:true,&quot;card_prefetch_interval_in_seconds&quot;:2000,&quot;dm_quick_reply_options_panel_dismiss_in_ms&quot;:2000},&quot;whitelistedVideoUser&quot;:false,&quot;autoplayDisabled&quot;:false,&quot;pushStatePageLimit&quot;:500000,&quot;routes&quot;:{&quot;profile&quot;:&quot;\/&quot;},&quot;pushState&quot;:true,&quot;viewContainer&quot;:&quot;#page-container&quot;,&quot;dragAndDropPhotoUpload&quot;:true,&quot;href&quot;:&quot;\/login&quot;,&quot;searchPathWithQuery&quot;:&quot;\/search?q=query&amp;src=typd&quot;,&quot;timelineCardsGallery&quot;:true,&quot;composeAltText&quot;:false,&quot;deciders&quot;:{&quot;bulkUnfollowEnabled&quot;:true,&quot;custom_timeline_curation&quot;:false,&quot;native_notifications&quot;:true,&quot;dm_polling_frequency_in_seconds&quot;:3000,&quot;dm_granular_mute_controls&quot;:true,&quot;enable_media_tag_prefetch&quot;:true,&quot;foundMediaTrendingEnabled&quot;:false,&quot;enableMacawNymizerConversionLanding&quot;:false,&quot;hqImageUploads&quot;:false,&quot;largeHeaderImageUpload&quot;:true,&quot;live_pipeline_consume&quot;:true,&quot;mqImageUploads&quot;:false,&quot;partnerIdSyncEnabled&quot;:true,&quot;sruMediaCategory&quot;:true,&quot;photoSruGifLimitMb&quot;:15,&quot;promoted_video_logging_enabled&quot;:true,&quot;pushState&quot;:true,&quot;scribeReducedActionQueue&quot;:true,&quot;useHtml5Webcam&quot;:true,&quot;composeHideLeadingMentions&quot;:false,&quot;emojiRenderInComposer&quot;:true,&quot;emojifyTypeahead&quot;:true,&quot;emojiCloseOnEnterKey&quot;:true,&quot;hideLeadingMentionsWithTooltip&quot;:true,&quot;contentEditablePlainTextOnly&quot;:false,&quot;web_client_api_stats&quot;:false,&quot;web_perftown_stats&quot;:true,&quot;web_perftown_ttft&quot;:true,&quot;web_client_events_ttft&quot;:true,&quot;log_push_state_ttft_metrics&quot;:true,&quot;web_sru_stats&quot;:false,&quot;web_upload_direct&quot;:true,&quot;web_upload_video&quot;:true,&quot;web_upload_video_advanced&quot;:false,&quot;upload_video_size&quot;:500,&quot;defaultVideoDuration&quot;:45,&quot;maxVideoDuration&quot;:140,&quot;internationalShippingEnabled&quot;:true,&quot;useV2EndpointsEnabled&quot;:true,&quot;useVmapVariants&quot;:false,&quot;autoplayPreviewPreroll&quot;:true,&quot;moments_lohp_enabled&quot;:true,&quot;enableNativePush&quot;:false,&quot;installNativePush&quot;:false,&quot;autoSubscribeNativePush&quot;:false,&quot;stickersInteractivity&quot;:true,&quot;stickersInteractivityDuringLoading&quot;:true,&quot;foundMediaExternalUploading&quot;:true,&quot;stickersExperience&quot;:true,&quot;dynamic_video_ads_include_long_videos&quot;:true,&quot;push_state_size&quot;:1000,&quot;should_not_unload_static_cards&quot;:true,&quot;live_video_media_control_enabled&quot;:false,&quot;use_api_for_tweet_like&quot;:true,&quot;use_api_for_tweet_unlike&quot;:false,&quot;edge_probe_enabled&quot;:false,&quot;web_consistent_settings&quot;:true},&quot;experiments&quot;:{},&quot;toasts_dm&quot;:false,&quot;toasts_timeline&quot;:false,&quot;toasts_dm_poll_scale&quot;:60,&quot;defaultNotificationIcon&quot;:&quot;https:\/\/abs.twimg.com\/a\/1486704320\/img\/t1\/mobile\/wp7_app_icon.png&quot;,&quot;uploadDomain&quot;:&quot;upload.twitter.com&quot;,&quot;promptbirdData&quot;:{&quot;promptbirdEnabled&quot;:false,&quot;immediateTriggers&quot;:[&quot;PullToRefresh&quot;,&quot;Navigate&quot;],&quot;format&quot;:null},&quot;passwordResetAdvancedLoginForm&quot;:true,&quot;skipAutoSignupDialog&quot;:false,&quot;shouldReplaceSignupWithLogin&quot;:true,&quot;hashflagBaseUrl&quot;:&quot;https:\/\/abs.twimg.com\/hashflags\/&quot;,&quot;activeHashflags&quot;:{&quot;koffeewithsania&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chinesenewyear&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;jiofilmfareshow&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;koffeeturntable&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithsushant&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;unilever_emoji\/unilever_emoji.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;scandal&quot;:&quot;ScandalABC_v4\/ScandalABC_v4.png&quot;,&quot;&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;chainedintokyo&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithirrfan&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithemraan&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithmadhavan&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithvidya&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;standwithpp&quot;:&quot;PP_emoji\/PP_emoji.png&quot;,&quot;heatison&quot;:&quot;Heat_Emoji\/Heat_Emoji.png&quot;,&quot;kwkonstarworld&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithajinkya&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithjackie&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithnargis&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;fiftyshadesmovie&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;koffeewithsalman&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;lebronjames&quot;:&quot;NBA_James\/NBA_James.png&quot;,&quot;shadowhunters&quot;:&quot;Shadowhunters_final72x72\/Shadowhunters_final72x72.png&quot;,&quot;koffeewithtendulkars&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithkangana&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;hawkersxelganso&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;chainedinneworleans&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;onatalvemvindo&quot;:&quot;cocacolaxmas_final72x72\/cocacolaxmas_final72x72.png&quot;,&quot;koffeewithimran&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;periscope&quot;:&quot;Periscope\/Periscope.png&quot;,&quot;beourguest&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;20mpdualcamera&quot;:&quot;Vivo_mobile_emoji\/Vivo_mobile_emoji.png&quot;,&quot;drivesafer&quot;:&quot;Aviva_emoji_72x72\/Aviva_emoji_72x72.png&quot;,&quot;fut&quot;:&quot;FUT72X72v2\/FUT72X72v2.png&quot;,&quot;russellwestbrook&quot;:&quot;NBA_westbrook\/NBA_westbrook.png&quot;,&quot;koffeewithhrithik&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithkapil&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithfrieda&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;pbapride&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;dieschöneunddasbiest&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;koffeewithjohn&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;lovetwitter&quot;:&quot;LoveTwitter\/LoveTwitter.png&quot;,&quot;bachelorabc&quot;:&quot;Bachelor_Emoji_72x72v2\/Bachelor_Emoji_72x72v2.png&quot;,&quot;thatsepic&quot;:&quot;Thatsepic_emoji\/Thatsepic_emoji.png&quot;,&quot;2017&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;detroitbasketball&quot;:&quot;Pistons_Emoji\/Pistons_Emoji.png&quot;,&quot;koffeewithdhoni&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;piratesofthecaribbean&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;dubaiparksandresorts&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;koffeewithsohail&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithrajyavardhan&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;victoriaoro&quot;:&quot;Victoria_Emojiv2\/Victoria_Emojiv2.png&quot;,&quot;defendtheland&quot;:&quot;Cavs_Emoji\/Cavs_Emoji.png&quot;,&quot;kembawalker&quot;:&quot;NBA_walker\/NBA_walker.png&quot;,&quot;katyperry&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;thatsok&quot;:&quot;Thatsok_emoji\/Thatsok_emoji.png&quot;,&quot;fiftyshadesmasquerade&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;makeinindia&quot;:&quot;MakeInIndia\/MakeInIndia.png&quot;,&quot;cttrvideo&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;westjetchristmas&quot;:&quot;WestJet_Emoji\/WestJet_Emoji.png&quot;,&quot;chainedinsydney&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;nba&quot;:&quot;NBALogo_Emoji\/NBALogo_Emoji.png&quot;,&quot;quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;amazingishappening&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;4ellen&quot;:&quot;Ellen_emoji_2\/Ellen_emoji_2.png&quot;,&quot;emojihawkers&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;wannasprite&quot;:&quot;Sprite_Emoji\/Sprite_Emoji.png&quot;,&quot;chainedvideo&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;kapba&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;kungheifatchoy&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;thebachelorabc&quot;:&quot;Bachelor_Emoji_72x72v2\/Bachelor_Emoji_72x72v2.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;happyvalent&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;koffeewithleander&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;unilever_emoji\/unilever_emoji.png&quot;,&quot;mahoubarrica&quot;:&quot;Mahou_Emojiv2\/Mahou_Emojiv2.png&quot;,&quot;kevinlove&quot;:&quot;NBA_love\/NBA_love.png&quot;,&quot;koffeewithshahrukh&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;stiaconnoi&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;chainedinmiami&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;babygroot&quot;:&quot;GotG_grootv2\/GotG_grootv2.png&quot;,&quot;filmfareawards2017&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;chainedinberlin&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithimtiaz&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedinrio&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;ittakeseverything&quot;:&quot;Clippers_Emoji\/Clippers_Emoji.png&quot;,&quot;ladycuervo&quot;:&quot;CdC_emoji\/CdC_emoji.png&quot;,&quot;katycttr&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;edsheeranbrits&quot;:&quot;EdSheeran_Emoji\/EdSheeran_Emoji.png&quot;,&quot;paulmillsap&quot;:&quot;NBA_millsap\/NBA_millsap.png&quot;,&quot;koffeewithyuvraj&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;bebégroot&quot;:&quot;GotG_grootv2\/GotG_grootv2.png&quot;,&quot;koffeewithmary&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;kwk100&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;lexusgx&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;chainedinoslo&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;katyiscoming&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;gongxifacai&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;koffeewithtusshar&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;beautyandthebeast&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;koffeewithkaran100&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;gamora&quot;:&quot;GotG_Gamorav2\/GotG_Gamorav2.png&quot;,&quot;filmfare2017&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;kwk&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;groot&quot;:&quot;GotG_grootv2\/GotG_grootv2.png&quot;,&quot;wearephx&quot;:&quot;Suns_Emoji\/Suns_Emoji.png&quot;,&quot;koffeewithsakshi&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedindetroit&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;philcup&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;lexusgs&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;klaythompson&quot;:&quot;NBA_thompson\/NBA_thompson.png&quot;,&quot;madeinphila&quot;:&quot;Sixers_Emoji\/Sixers_Emoji.png&quot;,&quot;kpgrammys&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;candyhearts&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;demarderozan&quot;:&quot;NBA_Derozan\/NBA_Derozan.png&quot;,&quot;bollywoodparksdubai&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;&quot;:&quot;Monsterstrike_emoji_final72x72\/Monsterstrike_emoji_final72x72.png&quot;,&quot;koffeewithsachin&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithmilkha&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;todossomoscuervos&quot;:&quot;CdC_emoji\/CdC_emoji.png&quot;,&quot;hugsandkisses&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;knicks&quot;:&quot;Knicks_Emoji\/Knicks_Emoji.png&quot;,&quot;koffeewithkjo&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;outsiderswgn&quot;:&quot;WGN_Emoji_72x72v3\/WGN_Emoji_72x72v3.png&quot;,&quot;cttr&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;díadelpadrehawkers&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;koffeewithanju&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeecentury&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;foryourfanside&quot;:&quot;fanside_emoji\/fanside_emoji.png&quot;,&quot;shadowhunterschat&quot;:&quot;Shadowhunters_final72x72\/Shadowhunters_final72x72.png&quot;,&quot;pbapinoypride&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;katyperrychainedtotherhythm&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithrani&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;buzzcity&quot;:&quot;Hornets_Emoji\/Hornets_Emoji.png&quot;,&quot;christiangrey&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;thefilmfareshowwithjio&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;sweetheart&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;clubdecuervos&quot;:&quot;CdC_emoji\/CdC_emoji.png&quot;,&quot;gopacers&quot;:&quot;Pacers_Emoji\/Pacers_Emoji.png&quot;,&quot;iamgroot&quot;:&quot;GotG_grootv2\/GotG_grootv2.png&quot;,&quot;thefilmfareshow&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;laliga&quot;:&quot;LaLiga_Emoji\/LaLiga_Emoji.png&quot;,&quot;katyperrygrammys&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;chainedinbk&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;historiasdebar&quot;:&quot;Schin_emoji_Schin2_72_v2\/Schin_emoji_Schin2_72_v2.png&quot;,&quot;nyjahchallenge&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;koffeewithsiddharth&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;holdtight&quot;:&quot;Anz_emojiv2\/Anz_emojiv2.png&quot;,&quot;dídelpadrehawkers&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;koffeewithpusarla&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithkajol&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;fiftyshadespremiere&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;greysanatomy&quot;:&quot;GreysAnatomy_Emoji\/GreysAnatomy_Emoji.png&quot;,&quot;wethenorth&quot;:&quot;Raptors_Emojiv2\/Raptors_Emojiv2.png&quot;,&quot;&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;históriasdebar&quot;:&quot;Schin_emoji_Schin2_72_v2\/Schin_emoji_Schin2_72_v2.png&quot;,&quot;kyrieirving&quot;:&quot;NBA_Irving\/NBA_Irving.png&quot;,&quot;labelleetlabête&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;chainedinbrooklyn&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;philippinecup2017&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;gospursgo&quot;:&quot;Spurs_Emoji\/Spurs_Emoji.png&quot;,&quot;shadowhuntersseason2&quot;:&quot;Shadowhunters_final72x72\/Shadowhunters_final72x72.png&quot;,&quot;dubnation&quot;:&quot;Warriors_Emoji\/Warriors_Emoji.png&quot;,&quot;lovehappens&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;koffeewithsaurav&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithkaranonstarworld&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;takenote&quot;:&quot;Jazz_Emoji\/Jazz_Emoji.png&quot;,&quot;fiftyshades&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;koffeewithanil&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithfarah&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;lny&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;chainedtotherhythmvid&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;beyondbeautiful&quot;:&quot;CreamsilkEmoji_72x72v2\/CreamsilkEmoji_72x72v2.png&quot;,&quot;whoneedsavalentine&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;vivosuperday&quot;:&quot;Vivo_mobile_emoji\/Vivo_mobile_emoji.png&quot;,&quot;pbaphilcup@42&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;koffeewithrohit&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;guardiansofthegalaxy2&quot;:&quot;GotG_vol2\/GotG_vol2.png&quot;,&quot;chainedindesmoines&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithbhansali&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;impracticaljokers&quot;:&quot;Trutv_mustache_Emoji_v2\/Trutv_mustache_Emoji_v2.png&quot;,&quot;bebegroot&quot;:&quot;GotG_grootv2\/GotG_grootv2.png&quot;,&quot;lexus&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;motiongatedubai&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;koffeewithaditya&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;tirandoonda&quot;:&quot;Ruffles_Emoji\/Ruffles_Emoji.png&quot;,&quot;filmfare17&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;ignislaunch&quot;:&quot;Maruti_Ignis_72x72\/Maruti_Ignis_72x72.png&quot;,&quot;giannisantetokounmpo&quot;:&quot;NBA_giannis\/NBA_giannis.png&quot;,&quot;&quot;:&quot;Your_Way_Emoji\/Your_Way_Emoji.png&quot;,&quot;chainedtotherhythm&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithsunny&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithzoya&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;thebachelorfinale&quot;:&quot;Bachelor_Emoji_72x72v2\/Bachelor_Emoji_72x72v2.png&quot;,&quot;valentinesday&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;transformtheuniverse&quot;:&quot;CreamsilkEmoji_72x72v2\/CreamsilkEmoji_72x72v2.png&quot;,&quot;hawkers&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;cheddarlive&quot;:&quot;Cheddar_Emoji_v3\/Cheddar_Emoji_v3.png&quot;,&quot;lígatealhawkersbot&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;sid2017&quot;:&quot;Saferinternet_Emojiv2\/Saferinternet_Emojiv2.png&quot;,&quot;kawhileonard&quot;:&quot;NBA_leonard\/NBA_leonard.png&quot;,&quot;ligatealhawkersbot&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;chainedinstockholm&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;stephcurry&quot;:&quot;NBA_curryv2\/NBA_curryv2.png&quot;,&quot;lexusnx&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;koffeewithkiran&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedinlondon&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithkatrina&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithashwin&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedinmia&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;gordonhayward&quot;:&quot;NBA_Hayward\/NBA_Hayward.png&quot;,&quot;koffeewithshruti&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;vocêénossoconvidado&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;nbaallstar&quot;:&quot;NBA_All_Star_Emoji\/NBA_All_Star_Emoji.png&quot;,&quot;koffeewithtiger&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;piratasdelcaribe&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;lexusrc&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;koffeewithabhishek&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithrishi&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;angpau&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;greysabc&quot;:&quot;GreysAnatomy_Emoji\/GreysAnatomy_Emoji.png&quot;,&quot;koffeewithakhtar&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;buscandoactitud&quot;:&quot;Nissan_kicks\/Nissan_kicks.png&quot;,&quot;loveislove&quot;:&quot;PrideEmoji\/pride_emoji-final.png&quot;,&quot;hawkerslalía&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;fooddancing&quot;:&quot;Fooddancing_emoji\/Fooddancing_emoji.png&quot;,&quot;livefromlv&quot;:&quot;MGMemoji_final72x72\/MGMemoji_final72x72.png&quot;,&quot;koffeewithsanjay&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithsonam&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithjuhi&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;crownmaxine&quot;:&quot;CreamsilkEmoji_72x72v2\/CreamsilkEmoji_72x72v2.png&quot;,&quot;lexuslx&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;thebachelor&quot;:&quot;Bachelor_Emoji_72x72v2\/Bachelor_Emoji_72x72v2.png&quot;,&quot;fiftyshadesdarker&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;piratesdeadmentellnotales&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;koffeewithjadeja&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;littlemixbrits&quot;:&quot;littlemix_emoji\/littlemix_emoji.png&quot;,&quot;chainedinaukland&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;cttrvid&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;giannis&quot;:&quot;NBA_giannis\/NBA_giannis.png&quot;,&quot;&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;koffeewithanushka&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;ignisconcert&quot;:&quot;Maruti_Ignis_72x72\/Maruti_Ignis_72x72.png&quot;,&quot;chainedintoronto&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;canada150&quot;:&quot;Canada150_emojiv2\/Canada150_emojiv2.png&quot;,&quot;86&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;jiofilmfareawards2017&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;sacramentoproud&quot;:&quot;Kings_Emoji\/Kings_Emoji.png&quot;,&quot;isaiahthomas&quot;:&quot;NBA_thomas\/NBA_thomas.png&quot;,&quot;thunderup&quot;:&quot;Thunder_Emoji\/Thunder_Emoji.png&quot;,&quot;omgtr&quot;:&quot;GTRemoji_final72x72v3\/GTRemoji_final72x72v3.png&quot;,&quot;drax&quot;:&quot;GotG_Drax\/GotG_Drax.png&quot;,&quot;koffee100&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedinchicago&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;dcfamily&quot;:&quot;Wizards_Emoji\/Wizards_Emoji.png&quot;,&quot;koffeewithvirat&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithbobby&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;lexusrx&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;happylunarnewyear&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;koffeewithranveer&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;pba2017&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;chainedvid&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;celtics&quot;:&quot;Celtics_Emoji2\/Celtics_Emoji2.png&quot;,&quot;imlek&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;lookback16&quot;:&quot;MGMemoji_final72x72\/MGMemoji_final72x72.png&quot;,&quot;koffeewithhuma&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;kylelowry&quot;:&quot;NBA_Lowry\/NBA_Lowry.png&quot;,&quot;the1975brits&quot;:&quot;1975_emojiv2\/1975_emojiv2.png&quot;,&quot;bemyvalentine&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;koffeewithpriyanka&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithayushmann&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;mffl&quot;:&quot;Mavs_Emoji\/Mavs_Emoji.png&quot;,&quot;koffeewithsrk&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;rockets50&quot;:&quot;Rockets_Emoji\/Rockets_Emoji.png&quot;,&quot;lexuses&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;365amazing&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;koffeewithjacqueline&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;kpcttr&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithmadhuri&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;brits&quot;:&quot;Brits_trophy_emoji\/Brits_trophy_emoji.png&quot;,&quot;&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;koffeewithgagan&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedinmilan&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithalia&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;lunarnewyear&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;nagiisangpba&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;grindcity&quot;:&quot;Grizzlies_Emoji\/Grizzlies_Emoji.png&quot;,&quot;jiofilmfareawards&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;hawkerslalia&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;filmfareshow&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;wearthecrown&quot;:&quot;CreamsilkEmoji_72x72v2\/CreamsilkEmoji_72x72v2.png&quot;,&quot;lexusls&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;koffeewithrahul&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedtotherhythmvideo&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;labellaylabestia&quot;:&quot;BatB_emoji\/BatB_emoji.png&quot;,&quot;koffeewithshraddha&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithkaran&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;pbaphilcupseason42&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;bundesliga&quot;:&quot;Bundesliga_Season_Start\/Bundesliga_Season_Start.png&quot;,&quot;deandrejordan&quot;:&quot;NBA_jordan\/NBA_jordan.png&quot;,&quot;filmfareawardswithjio&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;amazingmeetsamazing&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;koffeewithnawazuddin&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;valentine&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;truetoatlanta&quot;:&quot;Hawks_Emoji\/Hawks_Emoji.png&quot;,&quot;koffeewithdimple&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;jamesharden&quot;:&quot;NBA_harden\/NBA_harden.png&quot;,&quot;chainedinla&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithanurag&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;proudlypba&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;pelicans&quot;:&quot;Pelicans_Emoji\/Pelicans_Emoji.png&quot;,&quot;ownthefuture&quot;:&quot;Bucks_Emoji\/Bucks_Emoji.png&quot;,&quot;demarcuscousins&quot;:&quot;NBA_cousins\/NBA_cousins.png&quot;,&quot;vivoperfectselfie&quot;:&quot;Vivo_mobile_emoji\/Vivo_mobile_emoji.png&quot;,&quot;scandalabc&quot;:&quot;ScandalABC_v4\/ScandalABC_v4.png&quot;,&quot;chainedinmexicocity&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;piratessweepstakes&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;wearepba&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;koffeewithabhinav&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;ignisshowroom&quot;:&quot;Maruti_Ignis_72x72\/Maruti_Ignis_72x72.png&quot;,&quot;koffeewithvijender&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;emelisandebrits&quot;:&quot;Emeli_emoji\/Emeli_emoji.png&quot;,&quot;chainedinatlanta&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithkareena&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;unlockmykoffeemug&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;50shadesdarker&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;gotgvol2&quot;:&quot;GotG_vol2\/GotG_vol2.png&quot;,&quot;chainedinchi&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;unpasomás&quot;:&quot;hsbc_emoji\/hsbc_emoji.png&quot;,&quot;diadelpadrehawkers&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;pepsihalftime&quot;:&quot;PepsiHalftime_emoji\/PepsiHalftime_emoji.png&quot;,&quot;chainedinseattle&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;chainedinparis&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;womentellall&quot;:&quot;Bachelor_Emoji_72x72v2\/Bachelor_Emoji_72x72v2.png&quot;,&quot;maxinefortheuniverse&quot;:&quot;CreamsilkEmoji_72x72v2\/CreamsilkEmoji_72x72v2.png&quot;,&quot;brunomarsbrits&quot;:&quot;BrunoMars_Emoji\/BrunoMars_Emoji.png&quot;,&quot;freshempire&quot;:&quot;Fresh_Empire_emoji\/Fresh_Empire_emoji.png&quot;,&quot;anthonydavis&quot;:&quot;NBA_davis\/NBA_davis.png&quot;,&quot;koffeewithabhay&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;koffeewithhirani&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;amazingishere&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;heforshe&quot;:&quot;HeForShe_fixed\/HeForShe_fixed.png&quot;,&quot;koffeewithvarun&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;marcgasol&quot;:&quot;NBA_gasol\/NBA_gasol.png&quot;,&quot;sanremo2017&quot;:&quot;Trigram_Ken_v2\/Trigram_Ken_v2.png&quot;,&quot;filmfareawards&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;cny&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;&quot;:&quot;MonsterStrike_final_72x72pngv2\/MonsterStrike_final_72x72pngv2.png&quot;,&quot;chainedinlosangeles&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;jimmybutler&quot;:&quot;NBA_Butler\/NBA_Butler.png&quot;,&quot;koffeewithsaif&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewitharbaaz&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;thatslove&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;koffeewithaamir&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;blackhistorymonth&quot;:&quot;BlackHistoryMonth\/BlackHistoryMonth.png&quot;,&quot;unpasomas&quot;:&quot;hsbc_emoji\/hsbc_emoji.png&quot;,&quot;thatscool&quot;:&quot;Thatscool_emoji\/Thatscool_emoji.png&quot;,&quot;koffeewithrajkummar&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;awesomemixtapevol2&quot;:&quot;GotG_vol2\/GotG_vol2.png&quot;,&quot;kevindurant&quot;:&quot;NBA_durant\/NBA_durant.png&quot;,&quot;perfectduo&quot;:&quot;Vivo_mobile_emoji\/Vivo_mobile_emoji.png&quot;,&quot;preparetobeamazed&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;koffeewithgovinda&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;nexaignis&quot;:&quot;Maruti_Ignis_72x72\/Maruti_Ignis_72x72.png&quot;,&quot;nbakicks&quot;:&quot;NBAKicks_Emojiv2\/NBAKicks_Emojiv2.png&quot;,&quot;bemine&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;koffeewithanjali&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithshikhar&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithamrita&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithayan&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;celebrateamazing&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;guardiansofthegalaxy&quot;:&quot;GotG_vol2\/GotG_vol2.png&quot;,&quot;&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;paulgeorge&quot;:&quot;NBA_george\/NBA_george.png&quot;,&quot;atfr&quot;:&quot;Bachelor_Emoji_72x72v2\/Bachelor_Emoji_72x72v2.png&quot;,&quot;secretadmirer&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;bellletstalk&quot;:&quot;Bell_emoji\/Bell_emoji.png&quot;,&quot;loniegotodo&quot;:&quot;Sabina_emoji\/Sabina_emoji.png&quot;,&quot;hawkerslalía&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;koffeewithaishwarya&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;johnwall&quot;:&quot;NBA_wall\/NBA_wall.png&quot;,&quot;valentines&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;bhm&quot;:&quot;BlackHistoryMonth\/BlackHistoryMonth.png&quot;,&quot;koffeequiz&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithanand&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;perfectselfie&quot;:&quot;Vivo_mobile_emoji\/Vivo_mobile_emoji.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;bullsnation&quot;:&quot;Bulls_Emoji\/Bulls_Emoji.png&quot;,&quot;noneofakind&quot;:&quot;Maruti_Ignis_72x72\/Maruti_Ignis_72x72.png&quot;,&quot;koffeewithdiana&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;lavengeancedesalazar&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;50shades&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;koffeewithkaranonsw&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithbhaichung&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithsaina&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;blacklivesmatter&quot;:&quot;BlackHistoryMonth\/BlackHistoryMonth.png&quot;,&quot;filmfare&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;katygrammys&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;starlord&quot;:&quot;GotG_Starlordv2\/GotG_Starlordv2.png&quot;,&quot;robbiewilliamsbrits&quot;:&quot;Robbie_Emojiv2\/Robbie_Emojiv2.png&quot;,&quot;lavenganzadesalazar&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;vivoindia&quot;:&quot;Vivo_mobile_emoji\/Vivo_mobile_emoji.png&quot;,&quot;willyoubemyvalentine&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;koffeewithfarhan&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;vivov5plus&quot;:&quot;Vivo_mobile_emoji\/Vivo_mobile_emoji.png&quot;,&quot;crowntheph&quot;:&quot;CreamsilkEmoji_72x72v2\/CreamsilkEmoji_72x72v2.png&quot;,&quot;milehighbasketball&quot;:&quot;Nugges_Emoji\/Nugges_Emoji.png&quot;,&quot;koffeewithshroffs&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedinatl&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;koffeewithsonakshi&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithritesh&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;sabina&quot;:&quot;Sabina_emoji\/Sabina_emoji.png&quot;,&quot;&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;chainedinsf&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;skeptabrits&quot;:&quot;Skepta_Emoji\/Skepta_Emoji.png&quot;,&quot;valentinesday2017&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;ripcity&quot;:&quot;Blazers_Emoji\/Blazers_Emoji.png&quot;,&quot;lakeshow&quot;:&quot;Lakers_Emoji\/Lakers_Emoji.png&quot;,&quot;koffeewithvirendra&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;letsgomagic&quot;:&quot;Magic_Emoji\/Magic_Emoji.png&quot;,&quot;ignis&quot;:&quot;Maruti_Ignis_72x72\/Maruti_Ignis_72x72.png&quot;,&quot;koffeewithtwinkle&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;Toyota_ALJ\/Toyota_ALJ.png&quot;,&quot;loveontwitter&quot;:&quot;Valentinesday_emoji\/Valentinesday_emoji.png&quot;,&quot;stephencurry&quot;:&quot;NBA_curryv2\/NBA_curryv2.png&quot;,&quot;nickviall&quot;:&quot;Bachelor_Emoji_72x72v2\/Bachelor_Emoji_72x72v2.png&quot;,&quot;filmfare2017withjio&quot;:&quot;Filmfare_Emoji_72x72\/Filmfare_Emoji_72x72.png&quot;,&quot;lexusis&quot;:&quot;Lexus_Emoji\/Lexus_Emoji.png&quot;,&quot;koffeewithsuzanne&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;draymondgreen&quot;:&quot;NBA_green\/NBA_green.png&quot;,&quot;koffeewithdeepika&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;piratasdocaribe&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;deadmentellnotales&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;koffeewithnarain&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;htgawm&quot;:&quot;HTGAWM_JAIL_Emoji\/HTGAWM_JAIL_Emoji.png&quot;,&quot;koffeewithmahesh&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithshahid&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;shadowhunterspremiere&quot;:&quot;Shadowhunters_final72x72\/Shadowhunters_final72x72.png&quot;,&quot;rocketraccoon&quot;:&quot;GotG_rocketv2\/GotG_rocketv2.png&quot;,&quot;koffeewithamitabh&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;istandwithpp&quot;:&quot;PP_emoji\/PP_emoji.png&quot;,&quot;powerofthepack&quot;:&quot;Timberwolves_Emojiv2\/Timberwolves_Emojiv2.png&quot;,&quot;koffeewithakshay&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;chainedinsanfrancisco&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;tgit&quot;:&quot;TGIT_Emoji\/TGIT_Emoji.png&quot;,&quot;pirateslife&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;koffeewithkabir&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;brooklyngrit&quot;:&quot;Nets_Emoji\/Nets_Emoji.png&quot;,&quot;twypcash&quot;:&quot;TwypCash_Emoji\/TwypCash_Emoji.png&quot;,&quot;koffeewithparineeti&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;riverlanddubai&quot;:&quot;DPR_final72x72v3\/DPR_final72x72v3.png&quot;,&quot;koffeewithnaseeruddin&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;bellcause&quot;:&quot;Bell_emoji\/Bell_emoji.png&quot;,&quot;kwkonsw&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;anastasiasteele&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;piratesdescaraïbes&quot;:&quot;PotC_emoji\/PotC_emoji.png&quot;,&quot;carnavalhawkers&quot;:&quot;Hawkers_Emoji_v3\/Hawkers_Emoji_v3.png&quot;,&quot;chainedinraleigh&quot;:&quot;KP_Emojiv2\/KP_Emojiv2.png&quot;,&quot;saferinternetday&quot;:&quot;Saferinternet_Emojiv2\/Saferinternet_Emojiv2.png&quot;,&quot;philippinecup&quot;:&quot;PBA_Emoji\/PBA_Emoji.png&quot;,&quot;koffeewithrohan&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;officialfifty&quot;:&quot;Fifty_Shades_emojiv2\/Fifty_Shades_emojiv2.png&quot;,&quot;koffeewitharjun&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;koffeewithkunal&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;koffeewithranbir&quot;:&quot;KoffeeKaran_emojiv4\/KoffeeKaran_emojiv4.png&quot;,&quot;&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;sbtix4life&quot;:&quot;BudLight_Emoji_v2\/BudLight_Emoji_v2.png&quot;,&quot;happychinesenewyear&quot;:&quot;LunarNewYear_emojiv5\/LunarNewYear_emojiv5.png&quot;,&quot;grammys&quot;:&quot;Grammys_Emoji\/Grammys_Emoji.png&quot;},&quot;initialState&quot;:{&quot;title&quot;:&quot;Login on Twitter&quot;,&quot;section&quot;:null,&quot;module&quot;:&quot;app\/pages\/login&quot;,&quot;cache_ttl&quot;:300,&quot;body_class_names&quot;:&quot;three-col logged-out ms-windows&quot;,&quot;doc_class_names&quot;:&quot;route-login login-responsive&quot;,&quot;route_name&quot;:&quot;login&quot;,&quot;page_container_class_names&quot;:&quot;AppContent wrapper wrapper-login&quot;,&quot;ttft_navigation&quot;:false}}">
	<input type="hidden" class="swift-boot-module" value="app/pages/login">
	<input type="hidden" id="swift-module-path"
		value="https://abs.twimg.com/k/swift/en">

	<script
		src="./Login on Twitter_files/init.en.40f1b1ccf73a20901fb9.js.download"
		async=""></script>
	<script id="swift_loading_indicator" nonce="aGUhl0lALrs3wak0NTX1Zw==">
		document.body.className = document.body.className + " "
				+ document.body.getAttribute("data-fouc-class-names");
	</script>

	<!-- BOOTSTRAP CORE STYLE  -->
	<link href="assets/css/bootstrap.css" rel="stylesheet" />
	<!-- FONT AWESOME STYLE  -->
	<link href="assets/css/font-awesome.css" rel="stylesheet" />
	<!-- ANIMATE STYLE  -->
	<link href="assets/css/animate.css" rel="stylesheet" />
	<!-- FLEXSLIDER STYLE  -->
	<link href="assets/css/flexslider.css" rel="stylesheet" />
	<!-- CUSTOM STYLE  -->
	<link href="assets/css/style.css" rel="stylesheet" />
	<!-- GOOGLE FONTS  -->
	<link
		href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'
		rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans'
		rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Lobster'
		rel='stylesheet' type='text/css' />
	<link href="css/MyClassDemo.css" rel="stylesheet" />
</head>
<body>
<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"> <!-- <h1>Expert</h1> -->
				<!-- 	<img src="assets/img/logo.png" /> -->
				</a>

			</div>
			<div class="right-div">
				<strong>Support : </strong> info@tweetsclassfication.com
			</div>

		</div>
	</div>
	<!-- LOGO HEADER END-->
	
	<section class="menu-section">
	<div class="container">
		<div class="row ">
			<div class="col-md-12">
				<div class="navbar-collapse collapse ">
					<ul id="menu-top" class="nav navbar-nav navbar-right">
						<li><a href="Home.jsp" class="menu-top-active">HOME</a></li>
						<li><a href="MyProfile.jsp">My Profile</a></li>
						<li><a href="PostTwitts.jsp">What's New</a></li>
						<li><a href="LogoutController">Logout</a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
	</section>
	<!-- MENU SECTION END-->

	<%
		//int userid = Integer.parseInt(session.getAttribute("id").toString());
		List<String> userlist = DataAccessLayer.getAvailableUsers();
	%>
	
	<table style="margin-left: 46%;">
		<% 
		for(String um:userlist)
		{
		
		%>
		
 		<tr style="margin-left: 30%; color: navy;">
		<form action="UnfollowController" method="post">
			<td><img alt="" src="images/user.png" height="60px;">&nbsp;&nbsp;&nbsp;<%=um%></td>
			
			<input type="hidden" name="userId" value="1" /> 
			<input type="hidden" name="profileId" value="3">
			<td><input type="submit" style="height: 25px;font-size: small; border-radius:5px; width: 60px; color: black; background-color: white;" value="ADD"></td>
		    </form>
		    
		</tr>
		
		<% }%>	
	</table>
</body>
</html>
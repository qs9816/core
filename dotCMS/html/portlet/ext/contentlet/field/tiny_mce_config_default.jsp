<%@page import="com.dotcms.enterprise.LicenseUtil"%>
<%@page import="com.dotmarketing.business.web.WebAPILocator"%>
<%@page import="com.dotmarketing.portlets.files.model.File"%>
<%@page import="com.dotmarketing.beans.Host"%>
<%@page import="com.dotmarketing.util.Config"%>
<%@page import="com.dotmarketing.util.UtilMethods"%>
<%@page import="com.dotmarketing.util.InodeUtils"%>

<%@page import="com.liferay.portal.model.User"%>
<% User userb= com.liferay.portal.util.PortalUtil.getUser(request); %>




var tinyMCEProps = {	
			theme: "modern",
			selector: "textarea",
    		menubar: true,
    		statusbar: true,
    		resize: "both",
    		plugins: [
        		"advlist anchor autolink lists link image charmap print preview hr anchor pagebreak",
        		"searchreplace wordcount visualblocks visualchars code fullscreen",
        		"insertdatetime media nonbreaking save table contextmenu directionality",
        		"emoticons template paste textcolor spellchecker colorpicker textpattern validation dotimageclipboard compat3x"
    		],

    		toolbar1: "styleselect | bold italic underline strikethrough |  alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | image dotimageclipboard  | link unlink  | spellchecker <%= LicenseUtil.getLevel()>=200 ? ",validation":"" %>",
    		spellchecker_languages : "English=en_US,Espa�ol=es_ES",
    		spellchecker_rpc_url : "/servlets/jmyspell-spellchecker",
    		paste_auto_cleanup_on_paste : true,

            paste_strip_class_attributes : "all",
            convert_urls : true,
            cleanup : true,
            
            urlconverter_callback : cmsURLConverter,
            verify_css_classes : false,
            <%
            //Get the default CSS file if doesn't exist load the /css/base.css
            String cssPath = Config.getStringProperty("WYSIWYG_CSS");
	        if(InodeUtils.isSet(cssPath)){%>
        		<%="content_css : \"" + cssPath + "\","%>	
	        <%}%>           	                  
            trim_span_elements : false,
            apply_source_formatting : true,
            valid_elements : "*[*]",
            relative_urls : true,
			document_base_url : "/",
			plugin_insertdate_dateFormat : "%Y-%m-%d",
            plugin_insertdate_timeFormat : "%H:%M:%S",
            paste_use_dialog : true,
            gecko_spellcheck : true,
    		image_advtab: true,
    		file_browser_callback: cmsFileBrowser
		};		

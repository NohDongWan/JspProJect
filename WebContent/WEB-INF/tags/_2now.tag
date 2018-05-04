
<%@ tag body-content="empty" pageEncoding="UTF-8" %>

<%@ taglib prefix="fmt"
	uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="date" class="java.util.Date">
 </jsp:useBean>
<fmt:formatDate value="${date}" type="both" timeStyle="long" dateStyle="long"/>

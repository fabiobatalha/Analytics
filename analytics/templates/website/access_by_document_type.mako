## coding: utf-8
% if content_scope in ['network', 'collection', 'journal']:
<div id="bydocumenttype" style="width:100%; height:400px;">
    <span id="loading_bydocumenttype">
        <img src="/static/images/loading.gif" />
        <h5>${_(u'loading')}</h5>
    </span>
</div>
<script language="javascript">
    $("#loading_bydocumenttype").show();
    $(document).ready(function() {
        var url =  "${request.route_url('accesses_bydocumenttype')}?code=${selected_code}&collection=${selected_collection_code}&range_start=${range_start}&range_end=${range_end}&callback=?";
        $.getJSON(url,  function(data) {
            % if selected_journal:
                data['options']['subtitle'] = {'text': '${selected_journal}'};
            % endif
            $('#bydocumenttype').highcharts(data['options']);
            $("#loading_bydocumenttype").hide();
        });
    });
</script>
% endif
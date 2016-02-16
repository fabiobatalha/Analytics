## coding: utf-8
<div class="row container-fluid">
  <div class="col-md-8">
    <div id="article_affiliations_map" style="width:100%; height:400px;">
        <span id="loading_article_affiliations_map">
            <img src="/static/images/loading.gif" />
            <h5>${_(u'loading')}</h5>
        </span>
    </div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">${_(u'Sobre o gráfico')}</h3>
      </div>
      <div class="panel-body">
          ${_(u'Este mapa apresenta o total de documentos por país de afiliação dos autores. Os valores totais de documentos deste mapa não podem ser considerados como totais de publicações da coleção uma vez que um documento pode ter mais um país de afiliação.')}
      </div>
    </div>
  </div>
</div>
<script language="javascript">
    $("#loading_article_affiliations").show();

    $(document).ready(function() {
        var url =  "${request.route_url('publication_article_affiliations_map')}?code=${selected_code}&collection=${selected_collection_code}&callback=?";

        $.getJSON(url,  function(data) {
            data.options.series[0].mapData = Highcharts.maps['custom/world'];
            $('#article_affiliations_map').highcharts('Map', data['options']);
            $("#loading_article_affiliations_map").hide();
        });
    });
</script>
## coding: utf-8
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html>
  <header>
    <title>${_(u'SciELO Estatísticas')} (Beta)</title>
    <link rel="stylesheet" href="/static/bootstrap-3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bootstrap-3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/static/bootstrap-3.2.0/css/bootstrap-tokenfield.min.css">
    <link rel="stylesheet" href="/static/bootstrap-3.2.0/css/tokenfield-typeahead.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/daterangepicker/daterangepicker.css" />
    <script src="/static/jquery-1.11.1/jquery-1.11.1.min.js"></script>
  </header>
  <body>
    <div class="row">
      <nav class="navbar navbar-inverse navbar-fixed-top logo_analytics" role="navigation">
        <div class="container-fluid">
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right" style="padding-right: 30px;">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${_(u'Coleções')} <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  % for acron, info in sorted(collections.items(), key=lambda x: x[1]['name']):
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="?collection=${acron}">${info['name']}</a></li>
                  % endfor
                </ul>
              </li>
              <li>
                <button type="submit" class="btn navbar-btn" data-toggle="modal" data-target="#journal_selector_modal">${_(u'selecionar periódico')}</button>
              </li>
            </ul>
          </div> <!-- collapse -->
        </div> <!-- container-fluid -->
      </nav>
    </div>
    <div class="row">
      <div class="header-col level1">
        <div class="container-fluid">
            <span id="collection_name">${selected_collection['name']}</span>
        </div>
      </div>
    </div>
    <div class="row">
      % if selected_journal:
      <div class="header-col level2">
        <div class="container-fluid">
            ${selected_journal} (${selected_journal_code})
            <a href="?journal=clean" class="remove_session">
              <span class="glyphicon glyphicon-remove-circle navbar-right"/>
            </a>
        </div>
      </div>
      % endif
    </div>
    <div class="row">
      % if selected_document:
      <div class="header-col level3">
        <div class="container-fluid">
            ${selected_document.original_title()}
            <a href="?document=clean" class="remove_session">
              <span class="glyphicon glyphicon-remove-circle navbar-right"/>
            </a>
        </div>
      </div>
      % endif
    </div>
    <div class="row">
      <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <ul class="nav navbar-nav">
            <li class="${'active' if page == 'accesses' else ''}">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${_(u'Acessos')} <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="${request.route_url('accesses_web')}">${_(u'Gráficos')}</a></li>
                <li><a href="${request.route_url('accesses_list_journals_web')}">${_(u'Periódicos')}</a></li>
                <li><a href="${request.route_url('accesses_list_issues_web')}">${_(u'Top 100 Issues')}</a></li>
                <li><a href="${request.route_url('accesses_list_articles_web')}">${_(u'Top 100 Artigos')}</a></li>
              </ul>
            </li>
            <li class="${'active' if page == 'publication' else ''}">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${_(u'Publicação')} <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="${request.route_url('publication_size_web')}">${_(u'Dimensões da coleção')}</a></li>
                <li><a href="${request.route_url('publication_article_web')}">${_(u'Gráficos de documentos')}</a></li>
                <li><a href="${request.route_url('publication_journal_web')}">${_(u'Gráficos de periódicos')}</a></li>
              </ul>
            </li>
            % if not 'bibliometrics' in under_development:
              <li class="${'active' if page == 'bibliometrics' else ''}">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${_(u'Bibliometria')} <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="${request.route_url('bibliometrics_journal_web')}">${_(u'Gráficos')}</a></li>
                  <li><a href="${request.route_url('bibliometrics_list_impact_factor_web')}">${_(u'Fator de Impacto 1, 2, 3, 4 e 5 anos')}</a></li>
                  <li><a href="${request.route_url('bibliometrics_list_granted_web')}">${_(u'Citações concedidas por periódicos')}</a></li>
                  <li><a href="${request.route_url('bibliometrics_list_received_web')}">${_(u'Citações recebidas por periódicos')}</a></li>
                  <li><a href="${request.route_url('bibliometrics_list_citing_forms_web')}">${_(u'Formas de citação do periódico')}</a></li>
                </ul>
              </li>
            % endif
            <li class="${'active' if page == 'downloads' else ''}">
              <a href="${request.route_url('downloads')}">${_(u'Downloads')}</a>
            </li>
            <li class="${'active' if page == 'faq' else ''}">
              <a href="${request.route_url('faq_web')}">FAQ</a>
            </li>
          </ul>
        </div> <!-- div container-fluid -->
      </nav>
    </div> <!-- div row -->
    <div class="row container-fluid" style="padding-left: 40px; padding-right: 40px;">
      <div class="panel panel-info">
          <div class="panel-heading">${_(u'Ferramenta em desenvolvimento disponível em versão Beta Test.')}</div>
          <div class="panel-body">
              ${_(u'Esta ferramenta esta em desenvolvimento e foi publicada com o objetivo de realizar testes de uso e performance. Todos os indicadores carregados são reais e estão sendo atualizados e inseridos gradativamente. Problemas de lentidão e indisponibilidade do serviços são esperados nesta fase.')}
          </div>
      </div>
      <%block name="central_container" />
    </div><!-- div row -->
    <div class="row container-fluid footer">
      <div class="col-md-4">
        <p>
          <strong>
            SciELO - Scientific Electronic Library Online <br>
            <a href="http://www.fapesp.br" target="_blank">FAPESP</a>
            <a href="http://www.cnpq.br" target="_blank">CNPq</a>
            <a href="http://www.bireme.org">BIREME</a>
            <a href="http://www.fapunifesp.edu.br" target="_blank">FapUnifesp</a>
          </strong>
        </p>
        <p>
          Avenida Onze de Junho, 269 - Vila Clementino 04041-050 São Paulo</p>
          <p>Tel.: +55 11 5083-3639/59 - Email: <a href="mailto:scielo@scielo.org">scielo@scielo.org</a>
        </p>
      </div>
      <div class="col-md-3">
        <h4>${_(u'Ajuda')}</h4>
        <ul>
          <li><a href="http://github.com/scieloorg/analytics/issues/new">${_(u'Reportar error')}</a></li>
          <li><a href="http://groups.google.com/group/scielo-discuss" target="_blank">${_(u'Lista de discussão')}</a></li>
        </ul>
      </div>
      <div class="col-md-3">
        <h4>${_(u'Desenvolvimento')}</h4>
        <ul>
          <li><a href="http://www.github.com/scieloorg/" target="_blank">GitHub</a></li>
          <li><a href="http://groups.google.com/group/scielo-dev" target="_blank">${_(u'Lista de desenvolvimento')}</a></li>
        </ul>
      </div>
      <div class="col-md-2">
        <form id="form_languages" method="POST">
          <select id="lang_options" name="_LOCALE_">
            <option value="pt" ${'selected=""' if locale == 'pt' else ''}>Português</option>
            <option value="en" ${'selected=""' if locale == 'en' else ''}>English</option>
            <option value="es" ${'selected=""' if locale == 'es' else ''}>Español</option>
            <option value="es_MX" ${'selected=""' if locale == 'es_MX' else ''}>Español (México)</option>
          </select>
        </form>
      </div>
    </div>
    <%include file="journal_selector_modal.mako"/>
    <script src="/static/bootstrap-3.2.0/js/bootstrap.min.js"></script>
    <script src="/static/moment/moment.min.js"></script>
    <script src="/static/highcharts/highstock.js"></script>
    <script src="/static/highcharts/plugins/export-csv-master/export-csv.js"></script>
    <script src="/static/daterangepicker/daterangepicker.js"></script>
    <script src="/static/jquery-1.11.1/plugins/jquery.number.min.js"></script>
    <script src="/static/bootstrap-3.2.0/js/bootstrap-tokenfield.min.js"></script>
    <script>$('.collapse').collapse()</script>
    <script type="text/javascript">
      Highcharts.setOptions({
        colors: ['#3366CC', '#DC3912', '#FF9900', '#109618', '#990099', '#0099C6', '#DD4477', '#66AA00', '#B82E2E', '#316395', '#22AA99', '#AAAA11', '#6633CC', '#E67300', '#8B0707', '#651067'],
        lang: {decimalPoint: '.', thousandsSep: ','}
      });
    </script>
    <script>
      $('#lang_options').change(
        function(){
          $('#form_languages').submit();
        });
    </script>
    <%block name="extra_js" />
  </body>
</html>
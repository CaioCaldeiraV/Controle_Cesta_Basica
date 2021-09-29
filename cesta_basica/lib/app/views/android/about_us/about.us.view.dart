import 'package:flutter/material.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({Key key}) : super(key: key);

  @override
  _AboutUsViewState createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  String textTitle = "Politica de Privacidade";
  String textBody =
      // ignore: lines_longer_than_80_chars
      "A sua privacidade é importante para nós. É política do respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no site , e outros sites que possuímos e operamos. Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado. Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado. Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis ​​para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados. Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei. O nosso site pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade. Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados. O uso continuado de nosso site será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contacto connosco.";

  // ignore: avoid_positional_boolean_parameters
  void changeButton(bool isPolicy) {
    if (isPolicy) {
      setState(() {
        textTitle = "Politica de Privacidade";
        textBody =
            // ignore: lines_longer_than_80_chars
            "A sua privacidade é importante para nós. É política do respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no site , e outros sites que possuímos e operamos. Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado. Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado. Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis ​​para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados. Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei. O nosso site pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade. Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados. O uso continuado de nosso site será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contacto connosco.";
      });
    } else {
      setState(() {
        textTitle = "Quem somos";

        textBody =
            // ignore: lines_longer_than_80_chars
            "Somos entusiastas na área de desenvolvimento e procuradores de soluções modernas para resoluções especificas.\nOi, nós somos a CONTROLE DE CESTAS BÁSICAS. O nosso objetivo principal? Oferecer os melhores serviços para gerenciamento na venda de cestas básicas que você já viu. Nós não nascemos ontem, e por isso mesmo já descobrimos a melhor maneira de gerenciar o seu negócio. O melhor de tudo? Fazemos questão de oferecer um excelente atendimento ao cliente. Além disso, estamos sempre de olho nas tendências mais recentes no mercado e nos esforçamos ao máximo para colocar os desejos dos nossos clientes em primeiro lugar. Foi assim que construímos a nossa história, e é por isso que temos orgulho de fazer parte do mercado de cestas básicas. Por último, gostaríamos de afirmar que a nossa principal prioridade é você, o nosso cliente. Esperamos que você desfrute da experiência dos nossos serviços que preparamos com tanto carinho.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.green,
                Theme.of(context).primaryColor,
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Controle Cestas Básicas',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    changeButton(true);
                  },
                  child: Text("Politica de Privacidade"),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    changeButton(false);
                  },
                  child: Text("Quem Somos"),
                ),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            textTitle,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.15),
                ),
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Text(textBody),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

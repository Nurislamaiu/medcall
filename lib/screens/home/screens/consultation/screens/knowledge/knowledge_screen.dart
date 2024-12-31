import 'package:flutter/material.dart';
import 'package:medcall/screens/home/screens/consultation/screens/knowledge/widgets/knowledge_faq_widget.dart';
import 'package:medcall/screens/home/screens/consultation/screens/knowledge/widgets/knowledge_support_widget.dart';
import 'package:medcall/util/color.dart';
import 'package:medcall/widgets/custom_banner.dart';

class KnowledgeBaseScreen extends StatelessWidget {
  const KnowledgeBaseScreen({Key? key}) : super(key: key);

  void _showSupportBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Свяжитесь с нами',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SupportButton(index: index);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final faqs = [
      FAQItem(
        question: "Как работает приложение MedCall?",
        answer:
        "Приложение MedCall позволяет вызвать врача или медицинскую сестру...",
      ),
      FAQItem(
        question: "Какие услуги можно заказать через приложение?",
        answer:
        "Мы предоставляем следующие услуги на дому:\n- Внутримышечные инъекции\n- Внутривенные инъекции\n- Капельницы\n- Перевязки\n- Установка мочевого катетера и стомы\n- Клизмы\n- Снятие алкогольной интоксикации",
      ),
      FAQItem(
        question: "Как быстро приедет медицинский работник?",
        answer:
        "Срок прибытия зависит от вашего местоположения и загруженности специалистов. Обычно медицинский работник приезжает в течение 1-2 часов после подтверждения заказа.",
      ),
      FAQItem(
        question: "Можно ли записаться заранее?",
        answer: "Да, вы можете указать удобное для вас время и дату визита.",
      ),
      FAQItem(
        question: "Безопасно ли это?",
        answer:
        "Все наши специалисты имеют медицинское образование, опыт работы и лицензии, подтверждающие их квалификацию.",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSupportBottomSheet(context),
        backgroundColor: ScreenColor.color6,
        child: const Icon(Icons.support_agent, color: Colors.white),
      ),
      body: Column(
        children: [
          CustomBannerOur(
            title: 'Часто задаваемые \nвопросы (FAQ)',
            subTitle: 'Найдите ответы на популярные вопросы.',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: faqs.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return FAQWidget(faq: faq);
              },
            ),
          ),
        ],
      ),
    );
  }
}
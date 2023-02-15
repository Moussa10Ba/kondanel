import 'package:flutter/material.dart';
import 'package:kondanel/common_widgets/card-list-view.dart';

import '../utils/constant.dart';


class BudgetListScreen extends StatefulWidget {
  const BudgetListScreen({Key? key}) : super(key: key);

  @override
  State<BudgetListScreen> createState() => _BudgetListScreenState();
}

class _BudgetListScreenState extends State<BudgetListScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Clic budget');
      },
      child: Container(
        height: 105,
              decoration: cardStyle,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                                  Image(
                                    image: AssetImage('images/fourniture.png'),
                                  ),
                          Column(
                            children: [
                              Text(
                                ' Fourniture et scolarite des enfants',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(

                                children: [
                                  Text('75000 Fcfa'),
                                  Text('      '),
                                  Text('Mer 25-Jan-2022')
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.chevron_right_outlined, color: mainBlueColor, size: 30,),

                         ],
                    ),


                  ],
                ),
              ),
            ),
    );
  }
}

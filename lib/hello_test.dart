
import 'package:money_free/model/expense.dart';
import 'package:money_free/model/pie_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<PieData> getPieData(List<Expense> regexpensess){
  List<PieData> dd =[];
  var sized = regexpensess.length;

  var numFood= 0;
  var numTravel= 0;
  var numLeisure= 0;
  var numWork= 0;
  for(int i=0;i<regexpensess.length;i++){
    if(regexpensess[i].category == Category.TRAVEL){
      numTravel++;
    }else if(regexpensess[i].category == Category.FOOD){
      numFood++;
    }else if(regexpensess[i].category == Category.LEISURE) {
      numLeisure++;
    }else{
      numWork++;
    }
  }


  if(numFood != 0){
    dd.add(PieData("Food", (numFood/sized) *100,"${((numFood/sized) *100).toStringAsFixed(0)}"));
  }

  if(numTravel != 0){
    dd.add(PieData("Travel", (numTravel/sized) * 100,"${((numTravel/sized) * 100).toStringAsFixed(0)}"));
  }
  if(numLeisure != 0){
    dd.add(PieData("Leisure", (numLeisure/sized) * 100,"${((numLeisure/sized) * 100).toStringAsFixed(0)}"));
  }
  if(numWork != 0){
    dd.add(PieData("Work", (numWork/sized) * 100,"${((numWork/sized) * 100).toStringAsFixed(0)}"));
  }

  return dd;
}


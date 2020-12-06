// import 'package:bloc_counter/cubit/couter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/couter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) {
        var counterCubit = CounterCubit();
        return counterCubit;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if(state.wasIncremented == true) {
            Scaffold.of(context).showSnackBar(
             SnackBar(
               content: Text('Incremented'),
              duration: Duration(microseconds: 2000),
             ),
            );
          } else if (state.wasIncremented == false) {
            Scaffold.of(context).showSnackBar(
             SnackBar(content: Text('Decremented'),
             duration: Duration(microseconds: 2000),
             ),
            );
          }
        },
        child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).decrement();
                          // context.bloc<CounterCubit>().decrement();
                        },
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                          // context.bloc<CounterCubit>().increment();
                        },
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                    ]
      )   
       ],
            )
        
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

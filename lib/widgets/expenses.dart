import 'package:flutter/material.dart';
import 'package:flutter_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_tracker/widgets/new_expense.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _reqisteredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 23,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Coat',
      amount: 35,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(expenses: _reqisteredExpenses),
          ),
        ],
      ),
    );
  }
}

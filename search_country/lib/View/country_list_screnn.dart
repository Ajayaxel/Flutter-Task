import 'package:flutter/material.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {

  final List _allCountries = [
    "India", "United States", "Canada", "Australia", "Germany", "France", "Italy", "Japan", "China", "Brazil",
    "Russia", "Mexico", "South Africa", "Argentina", "Spain", "Sweden", "Norway", "Finland", "Denmark", "Netherlands",
    "New Zealand", "Ireland", "Portugal", "Poland", "Switzerland", "Belgium", "Austria", "Czech Republic", "Hungary", "Turkey",
    "South Korea", "Thailand", "Indonesia", "Vietnam", "Philippines", "Malaysia", "Singapore", "UAE", "Saudi Arabia", "Qatar",
    "Egypt", "Nigeria", "Kenya", "Morocco", "Tunisia", "Chile", "Colombia", "Peru", "Ukraine", "Romania"
  ];

  List _filteredCountries = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCountries = _allCountries;
    _searchController.addListener(_filterCountries);
  }

  void _filterCountries() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCountries = _allCountries
          .where((country) => country.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F7),
      
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search Country',
                  prefixIcon: Icon(Icons.search, color: Colors.blue),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
            Expanded(
              child: _filteredCountries.isEmpty
                  ? const Center(
                      child: Text(
                        'No countries found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filteredCountries.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.blue.shade100),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.flag, color: Colors.blueAccent),
                            title: Text(
                              _filteredCountries[index],
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

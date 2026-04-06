// Inside lib/main.dart
class _MyHomePageState extends State<MyHomePage> {
  String _dbStatus = "Checking...";
  final ApiService _api = ApiService();

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  void _checkStatus() async {
    try {
      // Calls the /test-db endpoint defined in your backend main.py
      final response = await _api.checkBackendStatus(); 
      setState(() {
        _dbStatus = response ? "Backend Connected" : "Connection Failed";
      });
    } catch (e) {
      setState(() { _dbStatus = "Error connecting to server"; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Server Status:', style: TextStyle(fontSize: 18)),
            Text(_dbStatus, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
            ElevatedButton(
              onPressed: _checkStatus,
              child: const Text("Refresh Status"),
            ),
          ],
        ),
      ),
    );
  }
}
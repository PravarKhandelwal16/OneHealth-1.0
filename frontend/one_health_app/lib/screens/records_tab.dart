import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:file_picker/file_picker.dart';

class RecordsTab extends StatefulWidget {
  const RecordsTab({super.key});

  @override
  State<RecordsTab> createState() => _RecordsTabState();
}

class _RecordsTabState extends State<RecordsTab> {
  class _RecordsTabState extends State<RecordsTab> {
  final ApiService _apiService = ApiService();
  List<dynamic> _records = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRecords(); // Start fetching when the tab is opened
  }

  Future<void> _fetchRecords() async {
    try {
      // Replace "test_user_123" with your dynamic user ID logic
      final data = await _apiService.getRecords("test_user_123");
      setState(() {
        _records = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      // Optional: Show error message to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching records: $e")),
      );
    }
  }
  bool _isAnalyzing = false;
  static const Color slate800 = Color(0xFF1E293B);
  static const Color indigo600 = Color(0xFF4F46E5);

  void _handleUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );
    
    if (result != null && result.files.single.path != null) {
      setState(() => _isAnalyzing = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _isAnalyzing = false);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OneHealth AI: Extraction Complete"), backgroundColor: Colors.green),
      );
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: _isLoading
        ? const Center(child: CircularProgressIndicator()) // Loading state
        : _records.isEmpty
            ? const Center(child: Text("No medical records found.")) // Empty state
            : ListView.builder(
                itemCount: _records.length,
                itemBuilder: (context, index) {
                  final record = _records[index];
                  return RecordTile(
                    title: record['filename'] ?? 'Medical Report',
                    date: record['upload_date'] ?? 'No Date',
                    type: record['record_type'] ?? 'General',
                  );
                },
              ),
  );
}

  Widget _buildVaultSecurityIndicator() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade100)),
      child: const Row(children: [
        Icon(LucideIcons.shieldCheck, color: Colors.green, size: 20),
        SizedBox(width: 15),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Vault Integrity: 100%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text("AES-256 Encryption active.", style: TextStyle(color: Colors.grey, fontSize: 11)),
        ])),
      ]),
    );
  }

  Widget _buildUploadSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(gradient: const LinearGradient(colors: [slate800, Color(0xFF334155)]), borderRadius: BorderRadius.circular(28)),
      child: const Column(children: [
        Icon(LucideIcons.maximize, color: Colors.white, size: 36),
        SizedBox(height: 12),
        Text("Scan Medical Report", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        Text("OCR + NLP Parsing Active", style: TextStyle(color: Colors.white70, fontSize: 12)),
      ]),
    );
  }

  Widget _buildFolderGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _folderItem("Lab Reports", LucideIcons.fileText, Colors.blue),
        _folderItem("Prescriptions", LucideIcons.pill, Colors.orange),
        _folderItem("Imaging", LucideIcons.scan, Colors.teal),
        _folderItem("Insurance", LucideIcons.award, indigo600),
      ],
    );
  }

  Widget _folderItem(String t, IconData i, Color c) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade100)),
      child: Row(children: [const SizedBox(width: 15), Icon(i, color: c, size: 18), const SizedBox(width: 10), Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]),
    );
  }

  Widget _historyItem(String t, String d) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Row(children: [
        const Icon(LucideIcons.fileSignature, color: Colors.grey),
        const SizedBox(width: 15),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: const TextStyle(fontWeight: FontWeight.bold)), Text("PDF • AES Secured", style: const TextStyle(color: Colors.grey, fontSize: 11))])),
        Text(d, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ]),
    );
  }

  Widget _buildSectionHeader(String t, IconData i) {
    return Padding(padding: const EdgeInsets.only(bottom: 15), child: Row(children: [Icon(i, size: 20, color: indigo600), const SizedBox(width: 10), Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: slate800))]));
  }

  Widget _buildLoadingOverlay() {
    return Container(color: Colors.black54, child: const Center(child: CircularProgressIndicator(color: Colors.white)));
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PostCreateEditPage extends StatefulWidget {
  const PostCreateEditPage({
    super.key,
    this.id,
  });

  final String? id;
  @override
  State<PostCreateEditPage> createState() => _PostCreateEditPageState();
}

class _PostCreateEditPageState extends State<PostCreateEditPage> {
  final _formKey = GlobalKey<FormState>();

  late final bool _isEditing;
  late final DatabaseReference _database;

  bool _loading = false;
  String? _fieldTitle;
  String? _fieldPost;

  @override
  void initState() {
    _isEditing = widget.id != null;
    _database = FirebaseDatabase.instance.ref('posts');

    _loadData();

    super.initState();
  }

  Future<void> _loadData() async {
    if (!_isEditing) return;

    // Mostrar indicador de carregamento
    setState(() {
      _loading = true;
    });

    // Obter a respetiva nota do Firebase
    final snapshot = await _database.child(widget.id!).get();

    // Atualizar os campos de entrada com os dados obtidos do Firebase
    final post = snapshot.value as Map<Object?, Object?>;
    setState(() {
      _loading = false;
      _fieldTitle = post['title'] as String;
      _fieldPost = post['post'] as String;
    });
  }

  Future<void> _newPost() async {
    // Obter o id do utilizador autenticado no Firebase
    final userId = FirebaseAuth.instance.currentUser?.uid;

    // Criar a estrutura de dados da nota e enviar para o Firebase
    final noteData = {
      'userId': userId,
      'title': _fieldTitle,
      'post': _fieldPost,
    };
    await _database.push().set(noteData);
  }

  Future<void> _updatePost() async {
    // Atualizar a estrutura de dados da nota no Firebase
    final noteData = {
      'title': _fieldTitle,
      'post': _fieldPost,
    };
    await _database.child(widget.id!).update(noteData);
  }

  Future<void> _deletePost() async {
    await _database.child(widget.id!).remove();
  }

  Future<void> _onSubmit() async {
    setState(() {
      _loading = true;
    });

    _formKey.currentState?.save();
    if (!(_formKey.currentState?.validate() ?? false)) {
      setState(() {
        _loading = false;
      });
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: const Text(
                'Por-favor corrija os erros apresentados antes de avançar'),
          ),
        );
      return;
    }

    if (_isEditing) {
      await _updatePost();
    } else {
      await _newPost();
    }

    // Atualizar o estado da página para esconder o indicador de progresso
    setState(() {
      _loading = false;
    });

    // Verificar se a página ainda está montada
    if (!mounted) return;

    // Mostrar uma mensagem de sucesso
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(_isEditing
              ? 'Post editado com sucesso'
              : 'Post criado com sucesso!'),
        ),
      );

    // Voltar para a página anterior
    Navigator.of(context).pop();
  }

  Future<void> _onDelete() async {
    setState(() {
      _loading = true;
    });

    await _deletePost();

    // Atualizar o estado da página para esconder o indicador de progresso
    setState(() {
      _loading = false;
    });

    // Verificar se a página ainda está montada
    if (!mounted) return;

    // Mostrar uma mensagem de sucesso
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Nota apagada com sucesso'),
        ),
      );

    // Fechar o diálogo de confirmação
    Navigator.of(context).pop();

    // Voltar para a página anterior
    Navigator.of(context).pop();
  }

  void _onDeleteConfirm() {
    showDialog<AlertDialog>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Apagar post?"),
        content: const Text('Tem a certeza que pretende apagar esta nota?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.blueGrey[300]),
            ),
          ),
          TextButton(
            onPressed: _onDelete,
            child: const Text(
              "Apagar",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar nota' : 'Criar nota'),
        actions: [
          if (_isEditing)
            IconButton(
              onPressed: _onDeleteConfirm,
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onSubmit,
        child: const Icon(Icons.save),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Título',
                    ),
                    autofocus: true,
                    initialValue: _fieldTitle,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Introduza um título';
                      }
                      return null;
                    },
                    onSaved: (value) => _fieldTitle = value,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nota',
                    ),
                    initialValue: _fieldPost,
                    minLines: 3,
                    maxLines: null,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Introduza uma nota';
                      }
                      return null;
                    },
                    onSaved: (value) => _fieldPost = value,
                  ),
                ],
              ),
            ),
    );
  }
}

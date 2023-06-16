import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/Forum/create_edit/view/post_create_edit_page.dart';
import 'package:tp_m_ipscb/src/Forum/post_list/models/models.dart';
import 'package:tp_m_ipscb/src/Forum/post_list/widgets/widget.dart';
import 'package:tp_m_ipscb/src/Forum/post_list/widgets/post_list_item.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _NotesListPageState();
}

class _NotesListPageState extends State<PostListPage> {
  final List<Post> _posts = [];

  late final DatabaseReference _database;

  bool _loading = false;

  @override
  void initState() {
    _database = FirebaseDatabase.instance.ref('posts');

    _loadData();

    super.initState();
  }

  Future<void> _loadData() async {
    // Mostrar indicador de carregamento
    setState(() {
      _loading = true;
    });

    // Obter o id do utilizador autenticado no Firebase
    final userId = FirebaseAuth.instance.currentUser?.uid;

    // Obter as notas do utilizador do Firebase
    final snapshot =
        await _database.orderByChild("userId").equalTo(userId).get();

    // Limpar a lista de notas
    _posts.clear();

    // Adicionar as notas obtidas do Firebase à lista
    for (var element in snapshot.children) {
      final post = Post.fromSnapshot(
        element.key,
        element.value,
      );
      _posts.add(post);
    }

    // Esconder indicador de carregamento
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas'),
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const PostCreateEditPage(),
            ),
          );
          _loadData();
        },
        child: const Icon(Icons.add),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: RefreshIndicator(
                onRefresh: _loadData,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final post = _posts[index];
                    return PostListItem(
                      title: post.title,
                      post: post.post,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PostCreateEditPage(id: post.id),
                          ),
                        );
                        _loadData();
                      },
                    );
                  },
                  itemCount: _posts.length,
                ),
              ),
            ),
    );
  }
}

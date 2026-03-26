import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Perfil',
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  final Color verde = Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ===== APPBAR =====
      appBar: AppBar(
        backgroundColor: verde,
        title: Text("Meu Perfil"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // ===== STACK (BANNER + FOTO) =====
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 140,
                  color: verde,
                ),

                Positioned(
                    bottom: -40,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/minha_foto.jpg'), // coloque sua imagem na pasta assets
                    ),
                  ),
              ],
            ),

            SizedBox(height: 50),

            // ===== NOME + BIO =====
            Text(
              "Pedro H. Bosso",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6),

            Text(
              "Uma breve descrição sobre mim",
              style: TextStyle(color: Colors.grey[700]),
            ),

            SizedBox(height: 20),

            // ===== DESTAQUES (3 CONTAINERS) =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DestaqueItem(numero: "120", texto: "Posts"),
                DestaqueItem(numero: "500", texto: "Seguidores"),
                DestaqueItem(numero: "180", texto: "Seguindo"),
              ],
            ),

            SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [

                  CardItem(
                    titulo: 'Sobre Mim',
                    descricao: 'Apaixonado por tecnologia e desenvolvimento',
                    imagem: 'assets/programacao.jpg',
                  ),

                  SizedBox(height: 12),

                  CardItem(
                    titulo: 'Hobbies',
                    descricao: 'Programar, jogar e estudar tecnologia',
                    imagem: 'assets/jogos.jpg',
                  ),

                  SizedBox(height: 12),

                  CardItem(
                    titulo: 'O que estou estudando',
                    descricao: 'Flutter e desenvolvimento mobile',
                    imagem: 'assets/flutter.jpg',
                  ),

                  SizedBox(height: 12),

                  CardItem(
                    titulo: 'O que eu faço',
                    descricao: 'Desenvolvimento de pequenos projetos',
                    imagem: 'assets/projetos.jpg',
                  ),

                  SizedBox(height: 12),

                  // ===== 5º ATRIBUTO =====
                  CardItem(
                    titulo: 'Localização',
                    descricao: 'Americana - SP',
                    imagem: 'assets/americana.jpg',
                  ),
                ],
              ),
            ),

            // ===== REDES SOCIAIS =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.code),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.work_outline),
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: 20),
          ],
        ),
      ),

      // ===== BOTTOM NAVIGATION BAR =====
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Config",
          ),
        ],
      ),
    );
  }
}

// ===== WIDGET DE DESTAQUE =====
class DestaqueItem extends StatelessWidget {
  final String numero;
  final String texto;

  const DestaqueItem({required this.numero, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFD7F5D7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            numero,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(texto),
        ],
      ),
    );
  }
}

// ===== CARD REUTILIZÁVEL =====
class CardItem extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String imagem; 

  const CardItem({
    required this.titulo,
    required this.descricao,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFD7F5D7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // COLOQUE ISSO
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagem,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  descricao,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
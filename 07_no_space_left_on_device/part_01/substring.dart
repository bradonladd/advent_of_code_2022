class Dir {
  Dir(this.name);
  List<Txt> files = [];
  List<Dir> subDirectories = []; 

  int size = 0;

  String name;

  void addFile(Txt file) => files.add(file);
  void addSubDirectory(Dir dir) => subDirectories.add(dir); 

  int getSize() {
    for (var file in files) {
      this.size = this.size + file.size;
    }

    for (var subDirs in subDirectories) {
      this.size = this.size + subDirs.getSize();
    }

    return this.size;
  }

  int getAllUnderOneK() {
    var x = 0;
    print("Directory $name has size of $size");

    if (this.size <= 100000) {
        x = this.size;
      }
    for (var subDirs in subDirectories) {
      x = x + subDirs.getAllUnderOneK();
    }
    return x;
  }
}

// a
// -- 123124
// -- 231
// -- b
// -- -- 34134
// -- -- e
// -- -- -- 32342
// -- -- -- 34025095
// -- -- f
// -- -- -- 3343
// -- c
// -- -- d
// -- -- -- 9494
// -- -- -- g
// -- -- -- -- 2323



class Txt {
  Txt(this.size);
  int size = 0;
}


void main() {
  Dir a = Dir("a");
  Dir b = Dir("b");
  Dir c = Dir("c");
  Dir d = Dir("d");
  Dir e = Dir("e");
  Dir f = Dir("f");
  Dir g = Dir("g");

  a.addFile(Txt(123124));
  a.addFile(Txt(231));
  b.addFile(Txt(34134));
  e.addFile(Txt(32342));
  e.addFile(Txt(34025095));
  f.addFile(Txt(3343));
  d.addFile(Txt(9494));
  g.addFile(Txt(2323));

  a.addSubDirectory(b);
  a.addSubDirectory(c);
  b.addSubDirectory(e);
  b.addSubDirectory(f);
  c.addSubDirectory(d);
  d.addSubDirectory(g);

  a.getSize();

  print(a.getAllUnderOneK());

  

}
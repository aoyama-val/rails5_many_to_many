User.delete_all

u1 = User.create(name: "u1")
u2 = User.create(name: "u2")

u1.tag_list.add("t1")
u1.save

u2.tag_list.add("t1")
u2.tag_list.add("t2")
u2.save

pp u1.tag_list
pp u2.tag_list

pp User.tagged_with("t1")
pp User.tagged_with("t2")

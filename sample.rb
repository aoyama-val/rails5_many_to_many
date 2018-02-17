User.delete_all
Group.delete_all
GroupUser.delete_all

ActiveRecord::Base.connection.reset_pk_sequence!("users")
ActiveRecord::Base.connection.reset_pk_sequence!("groups")
ActiveRecord::Base.connection.reset_pk_sequence!("group_users")

u1 = User.create(name: "aoyama")
u2 = User.create(name: "yamada")
u3 = User.create(name: "tanaka")
u4 = User.create(name: "satou")

g1 = Group.create(name: "g1")
g2 = Group.create(name: "g2")

u1.groups << g1
begin
  # 重複するレコードを挿入しようとすると例外が発生する
  u1.groups << g1
  puts "NG: 例外が発生しなかった"
rescue ActiveRecord::RecordNotUnique
  puts "OK: ちゃんと例外が発生した"
end
u2.groups << g2
u3.groups << g1
u3.groups << g2

puts u1.groups.include?(g1)  # => true
puts u1.groups.include?(g2)  # => false

User.all.each do |u|
  puts "ユーザー #{u.name} の所属するグループは:"
  u.groups.each do |g|
    puts g.name
  end
  puts
end

Group.all.each do |g|
  puts "グループ #{g.name} に所属するユーザーは:"
  g.users.each do |u|
    puts u.name
  end
  puts
end

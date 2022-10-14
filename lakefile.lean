import Lake
open Lake DSL

package str2term {
  -- add package configuration options here
}

lean_lib Str2Term {
  -- add library configuration options here
}

@[defaultTarget]
lean_exe str2term {
  root := `Main
}

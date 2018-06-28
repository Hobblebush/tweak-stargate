
def parse_draw_cmds(text)
  xs = text.split(/\s+/)
  cmds = []

  until xs.empty?
    cmd = xs[0]
    xs = xs.drop(1)

    args = xs.take_while do |x|
      x =~ /^[\d\-]+/
    end.map do |n|
      if n =~ /\,/
        n
      else
        n.to_f
      end
    end
    xs = xs.drop(args.size)

    cmds << [cmd].concat(args)
  end

  cmds
end

def draw_cmds_to_string(cmds)
  cmds.map {|cmd| cmd.map {|x| x.to_s}.join(' ') }.join(' ')
end


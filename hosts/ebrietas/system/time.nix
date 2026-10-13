{ self, ... }: {
  flake.hosts.ebrietas.system.time = {
    time.timeZone = "${self.userWillowispll.timezone}";
  };
}

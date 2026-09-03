{self, ...}: {
  flake.modules.hosts.ebrietas.time = {
    time.timeZone = "${self.userWillowispll.timezone}";
  };
}

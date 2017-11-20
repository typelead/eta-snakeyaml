{-# LANGUAGE DataKinds, TypeFamilies, TypeOperators, MultiParamTypeClasses #-}
module Java.SnakeYAML.Types where

import Java
import Java.Collections
import Interop.Java.IO

-- Start org.yaml.snakeyaml.Yaml

data Yaml = Yaml @org.yaml.snakeyaml.Yaml
  deriving Class

foreign import java unsafe "@new" newYaml :: Java a Yaml

foreign import java unsafe parse :: Reader -> Java Yaml (Iterable Event)

-- End org.yaml.snakeyaml.Yaml

-- Start org.yaml.snakeyaml.events.Event

data Event = Event @org.yaml.snakeyaml.events.Event
  deriving Class

foreign import java unsafe getArguments :: Java Event JString

foreign import java unsafe getEndMark :: Java Event Mark

foreign import java unsafe getStartMark :: Java Event Mark

foreign import java unsafe is :: ID -> Java Event Bool

-- End org.yaml.snakeyaml.events.Event

-- Start org.yaml.snakeyaml.error.Mark

data Mark = Mark @org.yaml.snakeyaml.error.Mark
  deriving Class

-- End org.yaml.snakeyaml.error.Mark

-- Start org.yaml.snakeyaml.error.Event.ID

data ID = ID @org.yaml.snakeyaml.events.Event$ID
  deriving Class

-- End org.yaml.snakeyaml.error.Event.ID

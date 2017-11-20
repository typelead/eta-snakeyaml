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

-- Start org.yaml.snakeyaml.events.CollectionEndEvent

data CollectionEndEvent = CollectionEndEvent @org.yaml.snakeyaml.events.CollectionEndEvent
  deriving Class

type instance Inherits CollectionEndEvent = '[Event, Object]

-- End org.yaml.snakeyaml.events.CollectionEndEvent

-- Start org.yaml.snakeyaml.events.MappingEndEvent

data MappingEndEvent = MappingEndEvent @org.yaml.snakeyaml.events.MappingEndEvent
  deriving Class

type instance Inherits MappingEndEvent = '[CollectionEndEvent, Event, Object]

-- End org.yaml.snakeyaml.events.MappingEndEvent

-- Start org.yaml.snakeyaml.events.SequenceEndEvent

data SequenceEndEvent = SequenceEndEvent @org.yaml.snakeyaml.events.SequenceEndEvent
  deriving Class

type instance Inherits SequenceEndEvent = '[CollectionEndEvent, Event, Object]

-- End org.yaml.snakeyaml.events.SequenceEndEvent

-- Start org.yaml.snakeyaml.events.DocumentEndEvent

data DocumentEndEvent = DocumentEndEvent @org.yaml.snakeyaml.events.DocumentEndEvent
  deriving Class

type instance Inherits DocumentEndEvent = '[Event, Object]

-- End org.yaml.snakeyaml.events.DocumentEndEvent

-- Start org.yaml.snakeyaml.events.DocumentStartEvent

data DocumentStartEvent = DocumentStartEvent @org.yaml.snakeyaml.events.DocumentStartEvent
  deriving Class

type instance Inherits DocumentStartEvent = '[Event, Object]

-- End org.yaml.snakeyaml.events.DocumentStartEvent

-- Start org.yaml.snakeyaml.events.NodeEvent

data NodeEvent = NodeEvent @org.yaml.snakeyaml.events.NodeEvent
  deriving Class

type instance Inherits NodeEvent = '[Event, Object]

-- End org.yaml.snakeyaml.events.NodeEvent

-- Start org.yaml.snakeyaml.events.AliasEvent

data AliasEvent = AliasEvent @org.yaml.snakeyaml.events.AliasEvent
  deriving Class

type instance Inherits AliasEvent = '[NodeEvent, Event, Object]

-- End org.yaml.snakeyaml.events.AliasEvent

-- Start org.yaml.snakeyaml.events.CollectionStartEvent

data CollectionStartEvent = CollectionStartEvent @org.yaml.snakeyaml.events.CollectionStartEvent
  deriving Class

type instance Inherits CollectionStartEvent = '[NodeEvent, Event, Object]

-- End org.yaml.snakeyaml.events.CollectionStartEvent

-- Start org.yaml.snakeyaml.events.MappingStartEvent

data MappingStartEvent = MappingStartEvent @org.yaml.snakeyaml.events.MappingStartEvent
  deriving Class

type instance Inherits MappingStartEvent = '[CollectionStartEvent, NodeEvent, Event, Object]

-- End org.yaml.snakeyaml.events.MappingStartEvent

-- Start org.yaml.snakeyaml.events.SequenceStartEvent

data SequenceStartEvent = SequenceStartEvent @org.yaml.snakeyaml.events.SequenceStartEvent
  deriving Class

type instance Inherits SequenceStartEvent = '[CollectionStartEvent, NodeEvent, Event, Object]

-- End org.yaml.snakeyaml.events.SequenceStartEvent

-- Start org.yaml.snakeyaml.events.ScalarEvent

data ScalarEvent = ScalarEvent @org.yaml.snakeyaml.events.ScalarEvent
  deriving Class

type instance Inherits ScalarEvent = '[NodeEvent, Event, Object]

-- End org.yaml.snakeyaml.events.ScalarEvent

-- Start org.yaml.snakeyaml.events.StreamEndEvent

data StreamEndEvent = StreamEndEvent @org.yaml.snakeyaml.events.StreamEndEvent
  deriving Class

type instance Inherits StreamEndEvent = '[Event, Object]

-- End org.yaml.snakeyaml.events.StreamEndEvent

-- Start org.yaml.snakeyaml.events.StreamStartEvent

data StreamStartEvent = StreamStartEvent @org.yaml.snakeyaml.events.StreamStartEvent
  deriving Class

type instance Inherits StreamStartEvent = '[Event, Object]

-- End org.yaml.snakeyaml.events.StreamStartEvent

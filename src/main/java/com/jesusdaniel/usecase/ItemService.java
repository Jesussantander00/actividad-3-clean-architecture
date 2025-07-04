package com.jesusdaniel.usecase;

import com.jesusdaniel.domain.Item;
import java.util.*;

public class ItemService {
    private final Map<String, Item> items = new HashMap<>();

    public void create(Item item) {
        if (items.containsKey(item.getId())) {
            throw new IllegalArgumentException("El item ya existe.");
        }
        items.put(item.getId(), item);
    }

    public Item read(String id) {
        return items.get(id);
    }

    public List<Item> readAll() {
        return new ArrayList<>(items.values());
    }

    public void update(Item item) {
        if (!items.containsKey(item.getId())) {
            throw new IllegalArgumentException("El item no existe.");
        }
        items.put(item.getId(), item);
    }

    public void delete(String id) {
        items.remove(id);
    }
}

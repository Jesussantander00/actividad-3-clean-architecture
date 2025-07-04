package com.jesusdaniel.usecase;

import com.jesusdaniel.domain.Item;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class ItemServiceTest {
    private ItemService service;

    @Before
    public void setUp() {
        service = new ItemService();
    }

    @Test
    public void testCreateAndReadItem() {
        // Arrange
        Item item = new Item("1", "Item 1");

        // Act
        service.create(item);
        Item result = service.read("1");

        // Assert
        assertNotNull(result);
        assertEquals("Item 1", result.getName());
    }

    @Test
    public void testUpdateItem() {
        // Arrange
        Item item = new Item("1", "Original");
        service.create(item);

        // Act
        item.setName("Updated");
        service.update(item);
        Item updated = service.read("1");

        // Assert
        assertEquals("Updated", updated.getName());
    }

    @Test
    public void testDeleteItem() {
        // Arrange
        Item item = new Item("1", "Item to delete");
        service.create(item);

        // Act
        service.delete("1");
        Item result = service.read("1");

        // Assert
        assertNull(result);
    }

    @Test
    public void testReadAllItems() {
        // Arrange
        service.create(new Item("1", "Item 1"));
        service.create(new Item("2", "Item 2"));

        // Act
        List<Item> allItems = service.readAll();

        // Assert
        assertEquals(2, allItems.size());
    }
}
